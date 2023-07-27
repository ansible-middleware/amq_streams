# Kafka Certificates

This document describes the steps done to create a set of certificates
to use locally with this collection. It is not for production purposes.

The certificates are created executing the next commands:

* Create Server keystore:

```shell
$ keytool -genkey -keystore server.keystore.jks -alias server -validity 999 -keyalg RSA -keypass password -storepass password
What is your first and last name?
  [Unknown]:  Ansible Collection for AMQ Streams
What is the name of your organizational unit?
  [Unknown]:  Ansible Middleware
What is the name of your organization?
  [Unknown]:  Ansible Middleware
What is the name of your City or Locality?
  [Unknown]:  GitHub
What is the name of your State or Province?
  [Unknown]:  Open Source
What is the two-letter country code for this unit?
  [Unknown]:  us
Is CN=Ansible Collection for AMQ Streams, OU=Ansible Middleware, O=Ansible Middleware, L=GitHub, ST=Open Source, C=us correct?
  [no]:  yes

Generating 2,048 bit RSA key pair and self-signed certificate (SHA256withRSA) with a validity of 999 days
        for: CN=Ansible Collection for AMQ Streams, OU=Ansible Middleware, O=Ansible Middleware, L=GitHub, ST=Open Source, C=us
```

* Generate x.509 certificate

```shell
$ openssl genrsa -out kafka.server.key 2048
```

```shell
$ openssl req -new -key kafka.server.key -out kafka.server.csr
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [XX]:us
State or Province Name (full name) []:Open Source
Locality Name (eg, city) [Default City]:GitHub
Organization Name (eg, company) [Default Company Ltd]:Ansible Middleware
Organizational Unit Name (eg, section) []:Ansible Middleware
Common Name (eg, your name or your server's hostname) []:localhost
Email Address []:

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
```

```shell
$ openssl x509 -req -days 999 -in kafka.server.csr -signkey kafka.server.key -out kafka.server.crt
Certificate request self-signature ok
subject=C = us, ST = Open Source, L = GitHub, O = Ansible Middleware, OU = Ansible Middleware, CN = localhost
```

```shell
$ openssl pkcs12 -export -name localhost -in kafka.server.crt -inkey kafka.server.key -out kafka.server.p12
Enter Export Password:
Verifying - Enter Export Password:
```

* Import certificate into keystore

```shell
$ keytool -keystore server.keystore.jks -alias localhost -importkeystore -srckeystore kafka.server.p12 -srcstoretype PKCS12
Importing keystore kafka.server.p12 to server.keystore.jks...
Enter destination keystore password:
Enter source keystore password:
```

* Create truststore importing the certificate

```shell
$ keytool -keystore server.truststore.jks -alias CARoot -import -file kafka.server.crt
Enter keystore password:
Re-enter new password:
Owner: CN=localhost, OU=Ansible Middleware, O=Ansible Middleware, L=GitHub, ST=Open Source, C=us
Issuer: CN=localhost, OU=Ansible Middleware, O=Ansible Middleware, L=GitHub, ST=Open Source, C=us
Serial number: 2d576d27fd5bd6ee932b6d2431c20cbf94a2c1f1
Valid from: Thu Jul 27 22:37:13 CEST 2023 until: Tue Apr 21 22:37:13 CEST 2026
Certificate fingerprints:
         SHA1: 4B:E8:C2:BE:78:44:99:58:AF:6A:51:82:F8:4D:8D:F8:93:9E:FF:EC
         SHA256: 2C:BA:17:7C:F5:4E:4C:37:FF:64:7F:DC:4F:3A:9A:CD:A2:DD:61:69:72:37:81:3E:C8:DF:27:DB:77:51:4F:0D
Signature algorithm name: SHA256withRSA
Subject Public Key Algorithm: 2048-bit RSA key
Version: 1
Trust this certificate? [no]:  yes
Certificate was added to keystore
```

* Generate client certificate

```shell
$ openssl pkcs12 -export -in kafka.server.crt -inkey kafka.server.key -out client.p12
Enter Export Password:
Verifying - Enter Export Password:
```

* Create Client keystore

```shell
$ keytool -keystore client.keystore.jks -alias CARoot -import -file kafka.server.crt -storepass password -keypass password -noprompt
Certificate was added to keystore
```

* Create Client truststore

```shell
$ keytool -keystore client.truststore.jks -alias CARoot -import -file kafka.server.crt -storepass password -keypass password -noprompt
Certificate was added to keystore
```
