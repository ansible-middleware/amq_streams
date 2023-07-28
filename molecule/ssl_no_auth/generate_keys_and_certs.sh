#!/bin/bash -eo pipefail
readonly KEYS_HOME='/opt'
readonly KEYSTORE_FILE="${KEYS_HOME}/server.keystore.jks"
readonly KAFKA_SERVER_KEY="${KEYS_HOME}/kafka.server.key"
readonly KAFKA_SERVER_CSR="${KEYS_HOME}/kafka.server.csr"
readonly KAFKA_SERVER_CRT="${KEYS_HOME}/kafka.server.crt"
readonly KAFKA_SERVER_P12="${KEYS_HOME}/kafka.server.p12"
readonly KAFKA_SERVER_TRUSTSTORE="${KEYS_HOME}/server.truststore.jks"
readonly CLIENT_P12="${KEYS_HOME}/client.p12"
readonly CLIENT_TRUSTSTORE_JKS="${KEYS_HOME}/client.truststore.jks"

cd "${KEYS_HOME}"

if [ ! -e "${KEYSTORE_FILE}" ]; then
  keytool -genkey -keystore "${KEYSTORE_FILE}" -alias server -validity 999 -keyalg RSA -keypass password -storepass password -dname "cn=Unknown, ou=Unknown, o=Unknown, c=Unknown"
fi

if [ ! -e "${KAFKA_SERVER_KEY}" ]; then
  openssl genrsa -out "${KAFKA_SERVER_KEY}" 2048
fi

if [ ! -e "${KAFKA_SERVER_CSR}" ]; then
  openssl req -new -key kafka.server.key -out "${KAFKA_SERVER_CSR}" -passin pass:client11 -subj "/C=US/ST=Molecule/L=Berlin /O=Ansible Middleware/OU=Test/CN=localhost/emailAddress=dummy@localhost.localdomain"
fi

if [ ! -e "${KAFKA_SERVER_CRT}" ]; then
  openssl x509 -req -days 999 -in "${KAFKA_SERVER_CSR}" -signkey "${KAFKA_SERVER_KEY}" -out "${KAFKA_SERVER_CRT}" > /dev/null
fi

if [ ! -e "${KAFKA_SERVER_P12}"  ]; then
  openssl pkcs12 -export -name localhost -in "${KAFKA_SERVER_CRT}" -inkey "${KAFKA_SERVER_KEY}" -out "${KAFKA_SERVER_P12}" -passout pass:client11
  keytool -keystore "${KEYSTORE_FILE}" -alias localhost -importkeystore -srckeystore "${KAFKA_SERVER_P12}" -srcstoretype PKCS12 -storepass password -srcstorepass client11 -noprompt
fi

#* Create truststore importing the certificate
#
#```shell
if [ ! -e "${KAFKA_SERVER_TRUSTSTORE}" ]; then
  keytool -keystore "${KAFKA_SERVER_TRUSTSTORE}" -alias CARoot -import -file "${KAFKA_SERVER_CRT}" -storepass password -noprompt
fi

if [ ! -e "${CLIENT_P12}" ]; then
  openssl pkcs12 -export -in "${KAFKA_SERVER_CRT}" -inkey "${KAFKA_SERVER_KEY}" -out "${CLIENT_P12}" -passout pass:client11
fi

if [ ! -e "${CLIENT_TRUSTSTORE_JKS}" ]; then
  keytool -keystore "${CLIENT_TRUSTSTORE_JKS}" -alias CARoot -import -file "${KAFKA_SERVER_CRT}" -storepass password -keypass password -noprompt
fi
