# Connect Role

Perform installation and configuration of Kafka Export.

## Role Defaults

| Variable | Description | Default |
|:---------|:------------|:--------|
|`redhat_streams_exporter_target_arch`| Specify physical architecture of target host | `{{ ansible_architecture }}` |
|`redhat_streams_exporter_version`| Exporter version to be used | `1.7.0` |
|`redhat_streams_exporter_download_base_url`| Base URL for downloading Exporter archive | `https://github.com/danielqsj/kafka_exporter/releases/download/` |
|`redhat_streams_exporter_download_url`| Download URL for Exporter archive | `{{ redhat_streams_exporter_download_base_url }}v{{ redhat_streams_exporter_version }}/kafka_exporter-{{ redhat_streams_exporter_version }}.{{ redhat_streams_exporter_target_system }}-{{ redhat_streams_exporter_target_arch }}.tar.gz` |
|`redhat_streams_exporter_archive_folder`| Folder name for Exporter | `kafka_exporter-{{ redhat_streams_exporter_version }}.{{ redhat_streams_exporter_target_system }}-{{ redhat_streams_exporter_target_arch }}` |
|`redhat_streams_exporter_archive_name`| Exporter archive name | `{{ redhat_streams_exporter_archive_folder }}.tar.gz` |
|`redhat_streams_exporter_download_dir`| Download dirname | `{{ lookup('env','PWD') | default('/opt') }}` |
|`redhat_streams_exporter_download_path`| Path to download directory (on controller) | `{{ redhat_streams_exporter_download_dir }}/{{ redhat_streams_exporter_archive_name }}` |
|`redhat_streams_exporter_download_host`| Hostname of download host (if not controller) | `localhost` |
|`redhat_streams_exporter_home`| Exporter home directory | `{{ redhat_streams_common_home }}` |
|`redhat_streams_exporter_server_start`| Exporter start script | `{{ redhat_streams_common_home }}/{{ redhat_streams_exporter_archive_folder }}/{{ redhat_streams_exporter_server_start_script }}` |
|`redhat_streams_exporter_dependencies`| Dependencies required by Exporter (RPM packages names) | `['tar', 'unzip']` |
|`redhat_streams_exporter_service_name`| Service name for the Exporter instance | `redhat_streams_exporter` |
|`redhat_streams_exporter_server_port`| Exporter server port | `9308` |
|`redhat_streams_exporter_server_start_script`| Exporter start script name | `kafka_exporter` |
|`redhat_streams_exporter_systemd_env_file`| Exporter service config file | `/etc/redhat_streams_exporter.conf` |
|`redhat_streams_exporter_service_config_template`| Templates to use for the systemd service for Exporter | `templates/service.conf.j2` |
|`redhat_streams_exporter_user`| User account, on targets, running the Exporter | `redhat_streams_exporter` |
|`redhat_streams_exporter_group`| Group account, on targets, Exporter user belongs to | `redhat_streams` |
|`redhat_streams_exporter_java_opts`| Java options to pass to Exporter JVM | `` |
|`redhat_streams_exporter_server_port_delay`| Delay before checking Exporter server's port availability | `0` |
|`redhat_streams_exporter_server_port_skip_wait`| Skip waiting for Exporter server port to be available | `False` |
|`redhat_streams_exporter_broker_server_host`| Broker's hostname | `{{ groups['brokers'][0] | default('localhost') }}` |
|`redhat_streams_exporter_broker_server_port`| Broker's port | `9092` |
|`redhat_streams_exporter_server_extra_args`| Extra arguments to Exporter service start command | `--group.filter='.*' --topic.filter='.*' --offset.show-all --verbosity=0 --kafka.version='{{ redhat_streams_common_product_version }}' --kafka.server={{ redhat_streams_exporter_broker_server_host }}:{{ redhat_streams_exporter_broker_server_port }}` |
