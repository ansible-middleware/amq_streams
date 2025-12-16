# AMQ Streams KRaft Role

This role orchestrates the initialization and configuration of Apache Kafka in KRaft (Kafka Raft Metadata) mode, removing the traditional dependency on ZooKeeper. It handles the mandatory bootstrapping process by generating a unique Cluster UUID (if not provided) and executing kafka-storage.sh to format the storage directories with the necessary metadata. Additionally, it prepares the critical configuration parameters required for a ZooKeeper-less environment, ensuring the correct setup of process roles, controller quorums, and the strict separation of broker and controller listeners.

## Requirements

* **Role Dependencies**: `amq_streams_common` (must be run first to install the Kafka binaries).
* **Kafka Version**: Designed for Kafka 4.0.0+ or Kafka 3.x with KRaft enabled.

## Role Variables

| Variable | Default Value | Description |
| :--- | :--- | :--- |
| `amq_streams_install_dir` | `/opt` | The base directory where AMQ Streams/Kafka is installed. |
| `amq_streams_kafka_home` | `{{ amq_streams_install_dir }}/kafka_{{ amq_streams_common_version }}/` | The absolute path to the Kafka installation home directory. |
| `amq_streams_kraft_config_dir` | `{{ amq_streams_kafka_home }}/config` | The directory containing `server.properties` and other config files. |
| `amq_streams_kraft_data_dir` | `{{ amq_streams_kafka_home }}/data/kraft` | The directory where Kafka stores its KRaft metadata and log data. |
| `amq_streams_cluster_id` | `""` | The UUID of the Kafka cluster. If left empty, the role will auto-generate a random UUID during the first run. |
| `amq_streams_kraft_node_id` | `1` | The unique integer ID for this specific broker/controller node. **Must be unique per host.** |
| `amq_streams_kraft_process_roles` | `"broker,controller"` | Defines the role of this node. Options: `broker`, `controller`, or `broker,controller` (combined). |
| `amq_streams_kraft_controller_quorum_voters` | `1@{{ ansible_host }}:{{ amq_streams_kraft_controller_port }}` | The voter connection string in the format `nodeId@host:port`. Must list all controller nodes in the cluster. |
| `amq_streams_kraft_listener_port` | `9092` | The port used for standard Client (broker) traffic. |
| `amq_streams_kraft_controller_port` | `9093` | The port used for Controller-to-Controller Raft communication. |
| `amq_streams_kraft_listeners` | *(See defaults)* | A list of all listeners to bind. Must include **both** the Controller and Broker listeners (e.g., `PLAINTEXT://...` and `CONTROLLER://...`). |
| `amq_streams_kraft_advertised_listeners` | *(See defaults)* | A list of listeners advertised to clients. Must **ONLY** include Broker listeners (e.g., `PLAINTEXT://...`). |
| `amq_streams_kraft_controller_listener_names` | `"CONTROLLER"` | The listener name used by the controller quorum (must match an entry in `listeners`). |
| `amq_streams_kraft_inter_broker_listener_name` | `"PLAINTEXT"` | The listener name used for replication between brokers. |
| `amq_streams_kraft_log_dirs` | `{{ amq_streams_kraft_data_dir }}` | The comma-separated list of directories for log data. Usually matches the data dir. |
| `amq_streams_kraft_log_retention_hours` | `168` | The number of hours to keep log segments before deletion (Default: 7 days). |
| `amq_streams_kraft_priv_escalation` | `yes` | Controls whether tasks (like creating directories and formatting storage) run with elevated privileges (`become: true`). |

## Example Playbook

```yaml
---
- hosts: kafka_brokers
  vars:
    amq_streams_common_version: "3.7.0"
    amq_streams_enable_kraft: true

  roles:
    # Install Java and Kafka Binaries
    - role: amq_streams_common

    # Configure and Format Storage for KRaft
    - role: amq_streams_kraft
      when: amq_streams_enable_kraft | bool

    # Start the Kafka Service
    - role: amq_streams_broker
```

## License

Apache License v2.0 or later

## Author Information

* [Ranabir Chakraborty](https://github.com/RanabirChakraborty)
