# Broker Role

Perform installation and configuration of Kafka brokers cluster.

This role requires to have a `zookeepers` group in the inventory file to identify
each node of he Zookeeper cluster. This group is used to set up the right
configuration files in order to establish the communication between Zookeeper cluster members.

The `brokers` group is used in the same way identifying the members of the Kafka cluster.
The order of this group will be used to set up the right configuration files and establish
the right cluster configuration:

Example of inventory:

```text
[zookeepers]
zknode1
zknode2
zknode3

[brokers]
broker1
broker2
broker3
broker4
```

## Role Defaults

| Variable | Description | Default |
|:---------|:------------|:--------|
|`amq_streams_broker_create_topic_script` |  | `{{ amq_streams_common_home }}/bin/kafka-topics.sh` |
|`amq_streams_broker_enabled` |  | `true` |
|`amq_streams_broker_server_start` |  | `{{ amq_streams_common_home }}/bin/kafka-server-start.sh` |
|`amq_streams_broker_config` |  | `/etc/amq_streams_broker.properties` |
|`amq_streams_broker_service_name` |  | `amq_streams_broker` |
|`amq_streams_broker_user` |  | `amq_streams_broker` |
|`amq_streams_broker_listener_port` |  | `9092` |
|`amq_streams_broker_group` |  | `amq_streams` |
|`amq_streams_broker_service_config_template` |  | `templates/service.conf.j2` |
|`amq_streams_broker_service_config_file` |  | `/etc/broker.conf` |
|`amq_streams_broker_logs_dir` |  | `/var/logs/{{ amq_streams_broker_service_name }}/` |
|`amq_streams_broker_num_network_threads` |  | `3` |
|`amq_streams_broker_num_io_threads` |  | `8` |
|`amq_streams_broker_buffer_send_bytes` |  | `102400` |
|`amq_streams_broker_buffer_bytes` |  | `102400` |
|`amq_streams_broker_socket_request_max_bytes` |  | `104857600` |
|`amq_streams_broker_num_partitions` |  | `1` |
|`amq_streams_broker_num_recovery_threads_per_data_dir` |  | `1` |
|`amq_streams_broker_offsets_topic_replication_factor` |  | `1` |
|`amq_streams_broker_transaction_state_log_replication_factor` |  | `1` |
|`amq_streams_broker_transaction_state_log_min_isr` |  | `1` |
|`amq_streams_broker_log_retention_hours` |  | `168` |
|`amq_streams_broker_log_retention_check_interval_ms` |  | `300000` |
|`amq_streams_broker_zookeeper_connection_timeout_ms` |  | `18000` |
|`amq_streams_broker_group_initial_rebalance_delay_ms` |  | `0` |
|`amq_streams_broker_properties_template` |  | `templates/server.properties.j2` |
|`amq_streams_broker_bootstrap_server_host` |  | `localhost` |
|`amq_streams_broker_bootstrap_server_port` |  | `9092` |
|`amq_streams_firewalld_package_name:` |  | `firewalld` |
|`amq_streams_firewalld_enabled` |  | `false` |
|`amq_streams_broker_instance_count_enabled` |  | `true` |
|`amq_streams_broker_instance_count` |  | `0` |
|`amq_streams_deployment_balance_check_enabled` |  | `true` |
|`amq_streams_zookeeper_auth_enabled` | Enable Zookeeper authentication. Zookeeper must be deployed with the authentication enabled. | `false` |
|`amq_streams_broker_zookeeper_auth_config` | JAAS file for brokers | `/etc/broker-jaas.conf` |
|`amq_streams_broker_zookeeper_auth_config_template` | JAAS template for brokers | `templates/broker-jaas.conf.j2` |

## Role Variables

The following are a set of required variables for the role:

| Variable | Description | Required |
|:---------|:------------|:---------|
|`amq_streams_zookeeper_auth_user` | Zookeeper user to authenticate. Mandatory if `amq_streams_zookeeper_auth_enabled: true` | '' |
|`amq_streams_zookeeper_auth_pass` | Zookeeper user password to authenticate. Mandatory if `amq_streams_zookeeper_auth_enabled: true`| '' |

## License

Apache License v2.0 or later

## Author Information

* [Romain Pelisse](https://github.com/rpelisse)
* [Guido Grazioli](https://github.com/guidograzioli)
