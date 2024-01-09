# Connect Role

Perform installation and configuration of Kafka Export.

## Role Defaults

| Variable | Description | Default |
|:---------|:------------|:--------|
|`amq_streams_exporter_target_arch`| Specify physical architecture of target host | `{{ ansible_architecture }}` |
|`amq_streams_exporter_version`| Exporter version to be used | `1.7.0` |
|`amq_streams_exporter_download_base_url`| Base URL for downloading Exporter archive | `https://github.com/danielqsj/kafka_exporter/releases/download/` |
|`amq_streams_exporter_download_url`| Download URL for Exporter archive | `{{ amq_streams_exporter_download_base_url }}v{{ amq_streams_exporter_version }}/kafka_exporter-{{ amq_streams_exporter_version }}.{{ amq_streams_exporter_target_system }}-{{ amq_streams_exporter_target_arch }}.tar.gz` |
|`amq_streams_exporter_archive_folder`| Folder name for Exporter | `kafka_exporter-{{ amq_streams_exporter_version }}.{{ amq_streams_exporter_target_system }}-{{ amq_streams_exporter_target_arch }}` |
|`amq_streams_exporter_archive_name`| Exporter archive name | `{{ amq_streams_exporter_archive_folder }}.tar.gz` |
|`amq_streams_exporter_download_dir`| Download dirname | `{{ lookup('env','PWD') | default('/opt') }}` |
|`amq_streams_exporter_download_path`| Path to download directory (on controller) | `{{ amq_streams_exporter_download_dir }}/{{ amq_streams_exporter_archive_name }}` |
|`amq_streams_exporter_download_host`| Hostname of download host (if not controller) | `localhost` |
|`amq_streams_exporter_home`| Exporter home directory | `{{ amq_streams_common_home }}` |
|`amq_streams_exporter_server_start`| Exporter start script | `{{ amq_streams_common_home }}/{{ amq_streams_exporter_archive_folder }}/{{ amq_streams_exporter_server_start_script }}` |
|`amq_streams_exporter_dependencies`| Dependencies required by Exporter (RPM packages names) | `['tar', 'unzip']` |
|`amq_streams_exporter_service_name`| Service name for the Exporter instance | `amq_streams_exporter` |
|`amq_streams_exporter_server_port`| Exporter server port | `9308` |
|`amq_streams_exporter_server_start_script`| Exporter start script name | `kafka_exporter` |
|`amq_streams_exporter_systemd_env_file`| Exporter service config file | `/etc/amq_streams_exporter.conf` |
|`amq_streams_exporter_service_config_template`| Templates to use for the systemd service for Exporter | `templates/service.conf.j2` |
|`amq_streams_exporter_user`| User account, on targets, running the Exporter | `amq_streams_exporter` |
|`amq_streams_exporter_group`| Group account, on targets, Exporter user belongs to | `amq_streams` |
|`amq_streams_exporter_java_opts`| Java options to pass to Exporter JVM | `` |
|`amq_streams_exporter_server_port_delay`| Delay before checking Exporter server's port availability | `0` |
|`amq_streams_exporter_server_port_skip_wait`| Skip waiting for Exporter server port to be available | `False` |
|`amq_streams_exporter_broker_server_host`| Broker's hostname | `{{ groups['brokers'][0] | default('localhost') }}` |
|`amq_streams_exporter_broker_server_port`| Broker's port | `9092` |
|`amq_streams_exporter_server_extra_args`| Extra arguments to Exporter service start command | `--group.filter='.*' --topic.filter='.*' --offset.show-all --verbosity=0 --kafka.version='{{ amq_streams_common_product_version }}' --kafka.server={{ amq_streams_exporter_broker_server_host }}:{{ amq_streams_exporter_broker_server_port }}` |
