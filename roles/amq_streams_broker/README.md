# Broker Role

Perform installation and configuration of Kafka brokers cluster.

This role requires to have a `zookeepers` group (identified by the
`amq_streams_zookeeper_inventory_group` variable) in the inventory file to identify
each node of he Zookeeper cluster. This group is used to set up the right
configuration files in order to establish the communication between Zookeeper cluster members.

The `brokers` group (identified by the `amq_streams_broker_inventory_group` variable)
is used in the same way identifying the members of the Kafka cluster.
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
|`amq_streams_broker_listener_port` | Port defined for external communications | `9092` |
|`amq_streams_broker_listener_internal_port` | Port defined for inter-broker communications | `9091` |
|`amq_streams_broker_group` |  | `amq_streams` |
|`amq_streams_broker_service_config_template` |  | `templates/service.conf.j2` |
|`amq_streams_broker_service_config_file` |  | `/etc/broker.conf` |
|`amq_streams_broker_data_dir` | Folders to store the commit logs (Comma-value property). | `/var/lib/{{ amq_streams_broker_service_name }}/` |
|`amq_streams_broker_logs_dir` | Folder to store the logs of broker service | `/var/log/{{ amq_streams_broker_service_name }}/` |
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
|`amq_streams_broker_listeners` | Default list of broker listeners | `PLAINTEXT://:{{ amq_streams_broker_listener_port }}` |
|`amq_streams_broker_auth_enabled` | Enable Broker authentication. | `false` |
|`amq_streams_broker_auth_scram_enabled` | Enable SASL SCRAM authentication. | `false` |
|`amq_streams_broker_auth_listeners` | Default list of authenticated listeners | `PLAINTEXT:PLAINTEXT` |
|`amq_streams_broker_auth_sasl_mechanisms` | Default list of authenticated SASL mechanism | `PLAIN` |
|`amq_streams_broker_inventory_group` | Identify the group of broker nodes | `groups['brokers']` |

## Role Variables

The following are a set of required variables for the role:

| Variable | Description | Required |
|:---------|:------------|:---------|
|`amq_streams_zookeeper_auth_user` | Zookeeper user to authenticate. Mandatory if `amq_streams_zookeeper_auth_enabled: true` | 'true' |
|`amq_streams_zookeeper_auth_pass` | Zookeeper user password to authenticate. Mandatory if `amq_streams_zookeeper_auth_enabled: true`| 'true' |

Enabling the `amq_streams_broker_auth_enabled` requires to define the following variables to execute the role successfully:

| Variable | Description | Required | Sample |
|:---------|:------------|:---------|:-------|
|`amq_streams_broker_auth_listeners` | List of authenticated listeners | `true` |
` - PLAINTEXT:PLAINTEXT
  - AUTHENTICATED://:9093` |
|`amq_streams_broker_auth_sasl_mechanisms` | Default list of authenticated SASL mechanism | `true` | `PLAIN` |
|`amq_streams_broker_auth_plain_users` | List of users (`username`, `password`) to add into the Kafka cluster | `true` | `` |

## Broker Authentication

This section includes a set of example to enable the broker authentication for the
following scenarios:

* SASL Plain authentication
* SASL SCRAM authentication 

### SASL Plain Authentication

This is a sample configuration to enable that configuration using two
different listeners, one for the clients (`AUTHENTICATED`) and other for
the inter-broker connections (`REPLICATION`). Both listeners require
a SASL plain authentication.

The `amq_streams_broker_auth_plain_users` variable defines the list of
different users to create to authenticate to the brokers.

The `amq_streams_broker_inter_broker_auth_sasl_mechanisms: PLAIN` property defines
the protocol to authenticate the inter-broker connections. That requires to
identify which user will be used to establish these connections, that user is defined
by the `amq_streams_broker_inter_broker_auth_broker_username` and `amq_streams_broker_inter_broker_auth_broker_password`
variables.

```yaml
    # BK Listeners
    amq_streams_broker_listeners:
      - AUTHENTICATED://:{{ amq_streams_broker_listener_port }}
      - REPLICATION://:{{ amq_streams_broker_listener_internal_port }}

    amq_streams_broker_inter_broker_listener: REPLICATION

    # BK Authentication
    amq_streams_broker_auth_enabled: 'true'
    amq_streams_broker_auth_listeners:
      - AUTHENTICATED:SASL_PLAINTEXT
      - REPLICATION:SASL_PLAINTEXT

    amq_streams_broker_auth_sasl_mechanisms:
      - PLAIN

    # Kafka Plain Users
    amq_streams_broker_auth_plain_users:
      - username: admin
        password: password
      - username: usr
        password: password

    amq_streams_broker_inter_broker_auth_sasl_mechanisms: PLAIN
    amq_streams_broker_inter_broker_auth_broker_username: interbroker
    amq_streams_broker_inter_broker_auth_broker_password: password
```

### SASL SCRAM Authentication

This is a sample configuration to enable that configuration using two
different listeners, one for the clients (`AUTHENTICATED`) and other for
the inter-broker connections (`REPLICATION`). Both listeners require
a SASL plain authentication. SCRAM authentication is enabled by the
`amq_streams_broker_auth_scram_enabled` variable.

Users must be created using the `kafka-configs.sh` script from Kafka.

The `amq_streams_broker_inter_broker_auth_sasl_mechanisms: SCRAM-SHA-512` property defines
the protocol to authenticate the inter-broker connections. That requires to
identify which user will be used to establish these connections, that user is defined
by the `amq_streams_broker_inter_broker_listener_auth` variable.

```yaml
    # BK Listeners
    amq_streams_broker_listeners:
      - AUTHENTICATED://:{{ amq_streams_broker_listener_port }}
      - REPLICATION://:{{ amq_streams_broker_listener_internal_port }}

    amq_streams_broker_inter_broker_listener: REPLICATION

    # BK Authentication
    amq_streams_broker_auth_enabled: 'true'
    amq_streams_broker_auth_scram_enabled: 'true'
    amq_streams_broker_auth_listeners:
      - AUTHENTICATED:SASL_PLAINTEXT
      - REPLICATION:SASL_PLAINTEXT

    amq_streams_broker_auth_sasl_mechanisms:
      - PLAIN
      - SCRAM-SHA-512

    amq_streams_broker_inter_broker_auth_sasl_mechanisms: SCRAM-SHA-512
    amq_streams_broker_inter_broker_listener_auth: |
      listener.name.replication.scram-sha-512.sasl.jaas.config=org.apache.kafka.common.security.scram.ScramLoginModule required username="<USER>" password="<PASSWORD>";
```

## License

Apache License v2.0 or later

## Author Information

* [Romain Pelisse](https://github.com/rpelisse)
* [Guido Grazioli](https://github.com/guidograzioli)
* [Roman Martin](https://github.com/rmarting)
