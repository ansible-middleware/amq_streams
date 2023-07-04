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

## Role Variables

The following are a set of required variables for the role:

| Variable | Description | Required |
|:---------|:------------|:---------|

## License

Apache License v2.0 or later

## Author Information

* [Romain Pelisse](https://github.com/rpelisse)
* [Guido Grazioli](https://github.com/guidograzioli)
* [Roman Martin](https://github.com/rmarting)

