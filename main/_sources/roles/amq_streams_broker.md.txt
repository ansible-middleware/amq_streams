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
|`amq_streams_broker_data_dir` | Folders to store the commit logs (Comma-value property) | `/var/lib/{{ amq_streams_broker_service_name }}/` |
|`amq_streams_broker_logs_dir` | Folder to store the logs of broker service | `/var/log/{{ amq_streams_broker_service_name }}/` |
|`amq_streams_broker_java_opts` | Default values to apply to `KAFKA_OPTS` env variable |  |
|`amq_streams_broker_java_heap_opts` | Default values to apply to `KAFKA_HEAP_OPTS` env variable | `-Xmx1G -Xms1G` |
|`amq_streams_broker_java_performance_opts` | Default values to apply to `KAFKA_JVM_PERFORMANCE_OPTS` env variable |  |
|`amq_streams_broker_java_java_gc_log_opts` | Default values to apply to `KAFKA_GC_LOG_OPTS` env variable |  |
|`amq_streams_broker_java_jmx_opts` | Default values to apply to `KAFKA_JMX_OPTS` env variable |  |
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
|`amq_streams_broker_advertised_listeners` | Default list of advertised listener per broker (hosts variable). Name must match those listed in the `amq_streams_broker_listeners` property |  |
|`amq_streams_broker_auth_enabled` | Enable Broker authentication | `false` |
|`amq_streams_broker_auth_scram_enabled` | Enable SASL SCRAM authentication | `false` |
|`amq_streams_broker_auth_listeners` | Default list of authenticated listeners | `PLAINTEXT:PLAINTEXT` |
|`amq_streams_broker_auth_sasl_mechanisms` | Default list of authenticated SASL mechanism | `PLAIN` |
|`amq_streams_broker_inventory_group` | Identify the group of broker nodes | `groups['brokers']` |
|`amq_streams_broker_broker_id` | Identify the broker with specific id in the inventory
|`amq_streams_broker_topics` | List of topics to create. Each topics requires the `name` property, and optionally the `partitions` and `replication_factor`. | |

## Role Variables

List of required variables for the role:

| Variable | Description | Required |
|:---------|:------------|:---------|
|`amq_streams_zookeeper_auth_user` | Zookeeper user to authenticate. Mandatory if `amq_streams_zookeeper_auth_enabled: true`. | 'true' |
|`amq_streams_zookeeper_auth_pass` | Zookeeper user password to authenticate. Mandatory if `amq_streams_zookeeper_auth_enabled: true`.| `true` |

Enabling the `amq_streams_broker_auth_enabled` requires to define the following variables to execute the role successfully:

| Variable | Description | Required | Sample |
|:---------|:------------|:---------|:-------|
|`amq_streams_broker_auth_listeners` | List of authenticated listeners | `true` |
` - PLAINTEXT:PLAINTEXT
  - AUTHENTICATED://:9093` |
|`amq_streams_broker_auth_sasl_mechanisms` | Default list of authenticated SASL mechanism | `true` | `PLAIN` |
|`amq_streams_broker_auth_plain_users` | List of users (`username`, `password`) to add into the Kafka cluster | `true` | `` |
|`amq_streams_broker_admin_username` | Default admin user to manage topics | `false` |  |
|`amq_streams_broker_admin_password` | Default password of the admin user to manage topics | `false` |  |

## TLS Encryption

Kafka supports TLS for encrypting communication with Kafka clients. The role allows
to enable TLS encryption but it is required to have a keystore containing private and
public keys.

The following variables are involved to enable TLS encryption:

| Variable | Description | Required | Default |
|:---------|:------------|:---------|:---------
|`amq_streams_broker_tls_enabled` | Enable TLS encryption for listeners | `false` | `false` |
|`amq_streams_broker_tls_keystore_dir` | Local folder with the keystore | `true` | `/tmp` |
|`amq_streams_broker_tls_keystore` | Filename of the keystore | `true` | `server.keystore.jks` |
|`amq_streams_broker_tls_keystore_location` | Location on Kafka server for the keystore | `true` | `/opt` |
|`amq_streams_broker_tls_keystore_password` | Password of the keystore | `true` | `PLEASE_CHANGEME_IAMNOTGOOD_FOR_PRODUCTION` |
|`amq_streams_broker_tls_truststore_dir` | Local folder with the truststore | `true` | `/tmp` |
|`amq_streams_broker_tls_truststore` | Filename of the truststore | `true` | `server.truststore.jks` |
|`amq_streams_broker_tls_truststore_location` | Location on Kafka server for the truststore | `true` | `/opt` |
|`amq_streams_broker_tls_truststore_password` | Password of the truststore | `true` | `PLEASE_CHANGEME_IAMNOTGOOD_FOR_PRODUCTION` |
|`amq_streams_broker_tls_truststore_client_dir` | Local folder with the keystore file used by clients | `false` | `/tmp` |
|`amq_streams_broker_tls_truststore_client` | Filename of the client truststore | `false` | `client.truststore.jks` |
|`amq_streams_broker_tls_truststore_client_location` | Location on Kafka server for the client truststore | `false` | `/opt` |
|`amq_streams_broker_tls_truststore_client_password` | Password of the client truststore | `false` | `PLEASE_CHANGEME_IAMNOTGOOD_FOR_PRODUCTION` |

Here a sample to enable SSL listeners at port `9093` for client connections and using
plain connections for inter-broker communication:

```yaml
  vars:
    # Enabling SSL listeners
    amq_streams_broker_tls_enabled: true
    amq_streams_broker_tls_keystore_dir: ./certs
    amq_streams_broker_tls_truststore_dir: ./certs
    amq_streams_broker_tls_truststore_client_dir: ./certs
    amq_streams_broker_tls_keystore_password: password
    amq_streams_broker_tls_truststore_password: password
    amq_streams_broker_tls_keystore_client_password: password
    amq_streams_broker_tls_truststore_client_password: password

    # Broker Listeners
    amq_streams_broker_listeners:
      - PLAINTEXT://:{{ amq_streams_broker_listener_port }} # Insecure for inter-broker connections
      - SSL://:{{ amq_streams_broker_listener_tls_port }} # Secure for client connections

    # Using SSL bootstrap server port for management operations
    amq_streams_broker_bootstrap_server_host: localhost
    amq_streams_broker_bootstrap_server_port: 9093
```

The client truststore identified by the `amq_streams_broker_tls_truststore_client` is only
required for topic or user management operations done by the role. The properties
`amq_streams_broker_bootstrap_server_host` and `amq_streams_broker_bootstrap_server_port`
are used to establish the admin connections to operate with topics or users.

## Broker Authentication

This section includes a set of example to enable the broker authentication for the
following scenarios:

* SASL PLAIN authentication
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
    # Broker Listeners
    amq_streams_broker_listeners:
      - AUTHENTICATED://:{{ amq_streams_broker_listener_port }}
      - REPLICATION://:{{ amq_streams_broker_listener_internal_port }}

    amq_streams_broker_inter_broker_listener: REPLICATION

    # Broker Authentication
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
    # Broker Listeners
    amq_streams_broker_listeners:
      - AUTHENTICATED://:{{ amq_streams_broker_listener_port }}
      - REPLICATION://:{{ amq_streams_broker_listener_internal_port }}

    amq_streams_broker_inter_broker_listener: REPLICATION

    # Broker Authentication
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

To manage SCRAM users, the role includes the following tasks:

* Create
* Describe
* Delete


The role uses the `amq_streams_broker_topics` variable to identify the list of topics
to be managed by the role for each stage of the life cycle.

The `amq_streams_broker_auth_scram_users` variable defines the list of
different SCRAM users to manage in the Kafka cluster.

Example of definition of SCRAM users:

```yaml
  vars:
    # Kafka SCRAM Users
    amq_streams_broker_auth_scram_users:
      - username: kafkauser01
        password: p@ssw0rd
      - username: kafkauser02
        password: p@ssw0rd
```

Creating SCRAM users can be done with this task:

```yaml
    - name: "Create SCRAM users"
      ansible.builtin.include_role:
        name: amq_streams_broker
        tasks_from: user-scram/create.yml
      loop: "{{ amq_streams_broker_auth_scram_users }}"
      loop_control:
        loop_var: user
      vars:
        user_username: "{{ user.username }}"
        user_password: "{{ user.password }}"
```

Describing SCRAM users can be done with this task:

```yaml
    - name: "Describe SCRAM users"
      ansible.builtin.include_role:
        name: amq_streams_broker
        tasks_from: user-scram/describe.yml
      loop: "{{ amq_streams_broker_auth_scram_users }}"
      loop_control:
        loop_var: user
      vars:
        user_username: "{{ user.username }}"
```

Deleting SCRAM users can be done with this task:

```yaml
    - name: "Delete SCRAM users"
      ansible.builtin.include_role:
        name: amq_streams_broker
        tasks_from: user-scram/delete.yml
      loop: "{{ amq_streams_broker_auth_scram_users }}"
      loop_control:
        loop_var: user
      vars:
        user_username: "{{ user.username }}"
```

### SASL Authentication over SSL listeners

SASL authentication mechanism using SSL listeners follows the same configuration described
above, however the listener must be declared as `SASL_SSL` and the authentication for
that listener must be declared as `SASL_SSL:SASL_SSL`.

Here an example of `vars` to authenticate over a SSL listener at `9093` port:

```yaml
  vars:
    # Enabling SSL
    amq_streams_broker_tls_enabled: true

    # Broker Listeners
    amq_streams_broker_listeners:
      - PLAINTEXT://:{{ amq_streams_broker_listener_port }} # Insecure for inter-broker connections
      - SASL_SSL://:{{ amq_streams_broker_listener_tls_port }} # Secured connections

    # Enabling Kafka Broker Authentication
    amq_streams_broker_auth_enabled: true
    amq_streams_broker_auth_scram_enabled: true
    amq_streams_broker_auth_listeners:
      - PLAINTEXT:PLAINTEXT
      - SASL_SSL:SASL_SSL

    amq_streams_broker_auth_sasl_mechanisms:
      - PLAIN
      - SCRAM-SHA-512

    # Using SSL bootstrap server port
    amq_streams_broker_bootstrap_server_host: localhost
    amq_streams_broker_bootstrap_server_port: 9093
```

## Topic Management

The role allows to manage the following stages of the life cycle of topics:

* Create
* Describe
* Delete

The role uses the `amq_streams_broker_topics` variable to identify the list of topics
to be managed by the role for each stage of the life cycle.

Example of definition of topics:

```yaml
  vars:
    # Topic management
    amq_streams_broker_topics:
      - name: sampleTopic
        partitions: 2
        replication_factor: 1
      - name: otherTopic
        partitions: 4
        replication_factor: 1
```

**NOTE:** To manage topics in a distributed Kafka broker, the operation should be done
in one single broker instance. Create or delete actions are replicated across the Kafka cluster.

### Create Topics

This task will create new topics in a Kafka broker:

```yaml
    - name: "Create topics"
      ansible.builtin.include_role:
        name: amq_streams_broker
        tasks_from: topic/create.yml
      loop: "{{ amq_streams_broker_topics }}"
      loop_control:
        loop_var: topic
      vars:
        topic_name: "{{ topic.name }}"
        topic_partitions: "{{ topic.partitions }}"
        topic_replication_factor: "{{ topic.replication_factor }}"
```

### Describe Topics

This task will describe the information and details of each topic from a Kafka broker:

```yaml
    - name: "Describe topics"
      ansible.builtin.include_role:
        name: amq_streams_broker
        tasks_from: topic/describe.yml
      loop: "{{ amq_streams_broker_topics }}"
      loop_control:
        loop_var: topic
      vars:
        topic_name: "{{ topic.name }}"
```

### Delete Topics

This task will delete topics from a Kafka broker:

```yaml
    - name: "Delete topics"
      ansible.builtin.include_role:
        name: amq_streams_broker
        tasks_from: topic/delete.yml
      loop: "{{ amq_streams_broker_topics }}"
      loop_control:
        loop_var: topic
      vars:
        topic_name: "{{ topic.name }}"
```

### Topic Management with Broker Authentication

To operate topics with this role in Broker with authentication enabled, it is required
to identify the mechanism of authentication and admin user credentials. The admin user
must be identified to connect to the Broker and execute the topic action.

The `amq_streams_broker_admin_mechanism` variable identifies the authentication mechanism from
one of the following options: `PLAIN`, `SCRAM-SHA-512`.

The `amq_streams_admin_username`, and `amq_streams_broker_admin_password` variables identify the
admin user.

All these variables are required to execute the actions.

Example of definition:

```yaml
  vars:
    # Enabling Kafka Broker Authentication
    amq_streams_broker_auth_enabled: 'true'
    amq_streams_broker_admin_mechanism: PLAIN
    amq_streams_broker_admin_username: admin
    amq_streams_broker_admin_password: password
```

## License

Apache License v2.0 or later

## Author Information

* [Romain Pelisse](https://github.com/rpelisse)
* [Guido Grazioli](https://github.com/guidograzioli)
* [Roman Martin](https://github.com/rmarting)
