AMQ Streams Install role
====================

A role to automate the installation of Zookeeper and AMQ Streams brokers.

Requirements
------------

Requirements on the target system are ensured by the role.

<!--start argument_specs-->
Role Defaults
-------------

| Variable | Description | Default |
|:---------|:------------|:--------|
|`amq_streams_install_product_version`|Version of the product used|`3.3.2`|
|`amq_streams_install_scala_version`|Scala version used to run amq streams|`2.13`|
|`amq_streams_install_version`|Scala version followed by product version|`"{{ amq_streams_install_scala_version }}-{{ amq_streams_install_product_version }}"`|
|`amq_streams_install_archive_file`|Downloaded archive filename|`"kafka_{{ amq_streams_install_version }}.tgz"`|
|`amq_streams_install_download_url`|Downlaod URL|`"https://downloads.apache.org/kafka/{{ amq_streams_install_product_version }}/kafka_{{ amq_streams_install_version }}.tgz"`|
|`amq_streams_install_download_dir`|Path to the download folder|`/opt`|
|`amq_streams_install_install_dir`|Path to the install dir for the product|`/opt`|
|`amq_streams_install_path_to_archive_file`|Full path to the archive file|`"{{ amq_streams_install_download_dir }}/{{ amq_streams_install_archive_file }}"`|
|`amq_streams_install_prereqs_dependencies:`|List of system dependencies required|`  - tar`|
|`amq_streams_install_openjdk_version`|Version of the default OpenJDK to install to run AMQ streams|`17`|
|`amq_streams_install_home`|AMQ Streams home directory|`"{{ amq_streams_install_install_dir }}/kafka_{{ amq_streams_install_version }}/"`|
|`amq_streams_install_create_topic_script`|Path to the kafka-topics.sh script|`"{{ amq_streams_install_home }}/bin/kafka-topics.sh"`|
|`amq_streams_install_zookeeper_enabled`|Ensure Zookeeper is installed on target|`True`|
|`amq_streams_install_zookeeper_config`|Path to Zookeeper properties file|`/etc/amq_streams_zookeeper.properties`|
|`amq_streams_install_zookeeper_config_template`|Path to template for Zookeeper properties|`templates/zookeeper.properties.j2`|
|`amq_streams_install_zookeeper_server_start`|Path to Zookeeper server start script|`"{{ amq_streams_install_home }}/bin/zookeeper-server-start.sh"`|
|`amq_streams_install_zookeeper_user`|System user running Zookeeper|`'amq_streams_zookeeper'`|
|`amq_streams_install_zookeeper_group`|System group for Zookeeper|`'amq_streams'`|
|`amq_streams_install_zookeeper_service_name`|Systemd service name for Zookeeper|`'amq_streams_zookeeper'`|
|`amq_streams_install_zookeeper_service_config_template`|Template for systemd service config for Zookeeper|`'templates/service.conf.j2'`|
|`amq_streams_install_zookeeper_port`|Zookeeper port|`2181`|
|`amq_streams_install_zookeeper_host`|Zookeeper host|`'localhost'`|
|`amq_streams_install_zookeeper_data_dir`|Zookeeper data directory|`/tmp/zookeeper`|
|`amq_streams_install_zookeeper_logs_dir`|Zookeeper logs directory|`"/var/log/{{ amq_streams_install_zookeeper_service_name }}/"`|
|`amq_streams_install_zookeeper_max_client_cnxns`|Zookeeper max client connection|`0`|
|`amq_streams_install_zookeeper_admin_enable_server`|Zookeeper server admin enable|`'false'`|
|`amq_streams_install_broker_enabled`|Broker setup enabled|`True`|
|`amq_streams_install_broker_server_start`|Path to the broker server start script|`"{{ amq_streams_install_home }}/bin/kafka-server-start.sh"`|
|`amq_streams_install_broker_config`|Path to broker properties file|`"/etc/amq_streams_broker.properties"`|
|`amq_streams_install_broker_service_name`|Systemd service name for AMQ broker|`'amq_streams_broker'`|
|`amq_streams_install_broker_user`|System user running the AMQ Streams broker|`'amq_streams_broker'`|
|`amq_streams_install_broker_group`|System group for user running the AMQ Streams broker|`'amq_streams'`|
|`amq_streams_install_broker_service_config_template`|Path to template file for broker.properties|`'templates/broker.conf.j2'`|
|`amq_streams_install_broker_service_config_file`|Path to the broker config file|`'/etc/broker.conf'`|
|`amq_streams_install_broker_logs_dir`|Path to AMQ Streams logs directory|`"/var/logs/{{ amq_streams_install_broker_service_name }}/"`|
|`amq_streams_install_broker_num_network_threads`|Broker number of network threads|`3`|
|`amq_streams_install_broker_num_io_threads`|Broker number of I/O threads|`8`|
|`amq_streams_install_broker_buffer_send_bytes`|Broker buffer send bytes size|`102400`|
|`amq_streams_install_broker_buffer_bytes`|Broker buffer bytes size|`102400`|
|`amq_streams_install_broker_socket_request_max_bytes`|Broker socket request max bytes|`104857600`|
|`amq_streams_install_broker_num_partitions`|Broker number of partitions|`1`|
|`amq_streams_install_broker_num_recovery_threads_per_data_dir`|Nimber of recovery threads by data directory|`1`|
|`amq_streams_install_broker_offsets_topic_replication_factor`|Broker offset topic replication factor|`1`|
|`amq_streams_install_broker_transaction_state_log_replication_factor`|State log replication factor|`1`|
|`amq_streams_install_broker_transaction_state_log_min_isr`|Min isr value|`1`|
|`amq_streams_install_broker_log_retention_hours`|Log retention hours|`168`|
|`amq_streams_install_broker_log_retention_check_interval_ms`|Log retention interval checks in ms|`300000`|
|`amq_streams_install_broker_zookeeper_connection_timeout_ms`|Zookeeper connection timeout in ms|`18000`|
|`amq_streams_install_broker_group_initial_rebalance_delay_ms`|Broker group intial rebalance delay in ms|`0`|
|`amq_streams_install_broker_properties_template`|Path to the Broker properties templates|`templates/server.properties.j2`|
|`amq_streams_install_systemd_home`|Path to the systemd config file directory|`'/usr/lib/systemd/system'`|
|`amq_streams_install_systemd_service_config_file_template`|Template used for defining the systemd service|`'templates/service_systemd.j2'`|
|`amq_streams_install_bootstrap_server_host`|AMQ Streams broker host|`localhost`|
|`amq_streams_install_bootstrap_server_port`|AMQ Streams broker port|`9092`|

Role Variables
--------------

* No required variables

<!--end argument_specs-->

## Dependencies

## Example Playbooks

### Default Install

Installs the default version of Wildfly to the default location with the default user.

```
---
- name: "Automate AMQ Streams install"
  hosts: all
  vars:
    topic_name: myTopic
  roles:
    - role: amq_streams_install
  tasks:

    - name: "Ensures topic {{ topic_name }} exist."
      ansible.builtin.include_role:
        name: amq_streams_install
        tasks_from: topic/create.yml

    - name: "Describe created topic."
      ansible.builtin.include_role:
        name: amq_streams_install
        tasks_from: topic/describe.yml
```

## License

GPL2

## Author Information

* [Romain Pelisse](https://github.com/rpelisse)
