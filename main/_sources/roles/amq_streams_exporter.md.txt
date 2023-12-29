# Connect Role

Perform installation and configuration of Kafka Export.

## Role Defaults

| Variable | Description | Default |
|:---------|:------------|:--------|
|`amq_streams_exporter_target_arch`| TODO document argument | `{{ ansible_architecture }}` |
|`amq_streams_exporter_version`| TODO document argument | `1.7.0` |
|`amq_streams_exporter_download_base_url`| TODO document argument | `https://github.com/danielqsj/kafka_exporter/releases/download/` |
|`amq_streams_exporter_download_url`| TODO document argument | `{{ amq_streams_exporter_download_base_url }}v{{ amq_streams_exporter_version }}/kafka_exporter-{{ amq_streams_exporter_version }}.{{ amq_streams_exporter_target_system }}-{{ amq_streams_exporter_target_arch }}.tar.gz` |
|`amq_streams_exporter_archive_folder`| TODO document argument | `kafka_exporter-{{ amq_streams_exporter_version }}.{{ amq_streams_exporter_target_system }}-{{ amq_streams_exporter_target_arch }}` |
|`amq_streams_exporter_archive_name`| TODO document argument | `{{ amq_streams_exporter_archive_folder }}.tar.gz` |
|`amq_streams_exporter_download_dir`| TODO document argument | `{{ lookup('env','PWD') | default('/opt') }}` |
|`amq_streams_exporter_download_path`| TODO document argument | `{{ amq_streams_exporter_download_dir }}/{{ amq_streams_exporter_archive_name }}` |
|`amq_streams_exporter_download_host`| TODO document argument | `localhost` |
|`amq_streams_exporter_home`| TODO document argument | `{{ amq_streams_common_home }}` |
|`amq_streams_exporter_server_start`| TODO document argument | `{{ amq_streams_common_home }}/{{ amq_streams_exporter_archive_folder }}/{{ amq_streams_exporter_server_start_script }}` |
|`amq_streams_exporter_dependencies`| TODO document argument | `['tar', 'unzip']` |
|`amq_streams_exporter_service_name`| TODO document argument | `amq_streams_exporter` |
|`amq_streams_exporter_server_port`| TODO document argument | `9308` |
|`amq_streams_exporter_server_start_script`| TODO document argument | `kafka_exporter` |
|`amq_streams_exporter_systemd_env_file`| TODO document argument | `/etc/amq_streams_exporter.conf` |
|`amq_streams_exporter_service_config_template`| TODO document argument | `templates/service.conf.j2` |
|`amq_streams_exporter_user`| TODO document argument | `amq_streams_exporter` |
|`amq_streams_exporter_group`| TODO document argument | `amq_streams` |
|`amq_streams_exporter_java_opts`| TODO document argument | `` |
|`amq_streams_exporter_server_port_delay`| TODO document argument | `0` |
|`amq_streams_exporter_server_port_skip_wait`| TODO document argument | `False` |
|`amq_streams_exporter_broker_server_host`| TODO document argument | `{{ groups['brokers'][0] | default('localhost') }}` |
|`amq_streams_exporter_broker_server_port`| TODO document argument | `9092` |
|`amq_streams_exporter_server_extra_args`| TODO document argument | `--group.filter='.*' --topic.filter='.*' --offset.show-all --verbosity=0 --kafka.version='{{ amq_streams_common_product_version }}' --kafka.server={{ amq_streams_exporter_broker_server_host }}:{{ amq_streams_exporter_broker_server_port }}` |
