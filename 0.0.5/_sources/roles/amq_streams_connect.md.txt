# Connect Role

Perform installation and configuration of Kafka Connect cluster.

## Role Defaults

| Variable | Description | Default |
|:---------|:------------|:--------|
|`amq_streams_connect_user` | Kafka connect user | `amq_streams_connect` |
|`amq_streams_connect_group` | User group | `amq_streams` |
|`amq_streams_connect_standalone_conf` | Connect configuration file | `{{ amq_streams_common_home }}/config/connect-standalone.properties` |
|`amq_streams_connect_file_connector_data` | List of files for the connector | `[foo, bar]` |
|`amq_streams_connect_file_source_conf` | Source connector configuration file | `{{ amq_streams_common_home }}/config/connect-file-source.properties` |
|`amq_streams_connect_file_sink` | Sink connector configuration file  | `{{ amq_streams_common_home }}/config/connect-file-sink.properties` |
|`amq_streams_connect_service_name` | Kafka connect service name | `amq_streams_connect` |
|`amq_streams_connect_logs_dir` | Kafka connect logs folder | `/var/log/{{ amq_streams_connect_service_name }}/` |
|`amq_streams_connect_server_start` | Kafka connect server start file | `{{ amq_streams_common_home }}/bin/connect-standalone.sh` |
|`amq_streams_connect_server_config` | Kafka connect configuration file | `{{ amq_streams_connect_standalone_conf }}` |
|`amq_streams_connect_server_extra_args` | Configuration extra arguments | `{{ amq_streams_connect_file_source_conf }} {{ amq_streams_connect_file_sink }}` |
|`amq_streams_connect_systemd_env_file` | Kafka connect environment file configuration | `/etc/amq_streams_connect.conf` |
|`amq_streams_connect_systemd_home:` | Systemd home | `/usr/lib/systemd/system` |
|`amq_streams_connect_service_description` | Kafka connect service description | `Kafka Connect server` |
|`amq_streams_connect_java_opts` | Default values to apply to `KAFKA_OPTS` env variable |  |
|`amq_streams_connect_java_heap_opts` | Default values to apply to `KAFKA_HEAP_OPTS` env variable | `-Xms256M -Xmx2G` |
|`amq_streams_connect_java_performance_opts` | Default values to apply to `KAFKA_JVM_PERFORMANCE_OPTS` env variable |  |
|`amq_streams_connect_java_java_gc_log_opts` | Default values to apply to `KAFKA_GC_LOG_OPTS` env variable |  |
|`amq_streams_connect_java_jmx_opts` | Default values to apply to `KAFKA_JMX_OPTS` env variable |  |

## Role Variables

The following are a set of required variables for the role:

| Variable | Description | Required |
|:---------|:------------|:---------|

If the Kafka Connect cluster has to connect to a Kafka Broker with authentication enabled, then
the `amq_streams_connect_broker_auth_enabled` is required, and the following variables to execute
the role successfully:

| Variable | Description | Required | Sample |
|:---------|:------------|:---------|:-------|
|`amq_streams_connect_bootstrap_servers` | Bootstrap connection to the Kafka Brokers | `true` |
`localhost:9092` |
|`amq_streams_connect_broker_admin_mechanism` | Authentication mechanism to connect to the Kafka brokers | `true` | `PLAIN` |
|`amq_streams_connect_broker_auth_username` | Default user to connect to the Kafka brokers | `true` | `broker` |
|`amq_streams_connect_broker_auth_password` | Default password to connecto to the Kafka brokers | `true` | `PLEASE_CHANGEME_IAMNOTGOOD_FOR_PRODUCTION` |
|`amq_streams_broker_admin_password` | Default password of the admin user to manage topics | `false` |  |
|`amq_streams_connect_broker_tls_enabled` | Enable SSL connections to the Kafka brokers | `false` | `false` |
|`amq_streams_connect_broker_tls_truststore_client_dir` | Local folder of the client truststore to use | `true` | `/tmp` |
|`amq_streams_connect_broker_tls_truststore_client` | Filename of the truststore | `true` | `client.truststore.jks` |
|`amq_streams_connect_broker_tls_truststore_client_location` | Location of the truststore in the Kafka Connect host | `true` | `/opt` |
|`amq_streams_connect_broker_tls_truststore_client_password` | Password of the truststore | `true` | `PLEASE_CHANGEME_IAMNOTGOOD_FOR_PRODUCTION` |

## License

Apache License v2.0 or later

## Author Information

* [Romain Pelisse](https://github.com/rpelisse)
* [Guido Grazioli](https://github.com/guidograzioli)
* [Roman Martin](https://github.com/rmarting)
