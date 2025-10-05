# Zookeeper Role

Perform installation and configuration of Zookeeper ensemble.

This role requires to have a `zookeepers` group (identified by the
`amq_streams_zookeeper_inventory_group` variable) in the inventory file to identify
each node of he Zookeeper cluster. This group is used to set up the right
configuration files in order to establish the communication between Zookeeper cluster members.

Example of inventory:

```text
[zookeepers]
zknode1
zknode2
zknode3
```

## Role Defaults

| Variable | Description | Default |
|:---------|:------------|:--------|
|`redhat_streams_zookeeper_enabled` | Enable zookeeper ensemble | `true` |
|`redhat_streams_zookeeper_config` | Zookeeper configuration file | `/etc/redhat_streams_zookeeper.properties` |
|`redhat_streams_zookeeper_config_template` | Zookeeper template configuration file | `templates/zookeeper.properties.j2` |
|`redhat_streams_zookeeper_server_start` | Zookeeper server start file | `{{ redhat_streams_common_home }}/bin/zookeeper-server-start.sh` |
|`redhat_streams_zookeeper_user` | Zookeeper user | `redhat_streams_zookeeper` |
|`redhat_streams_zookeeper_group` | User group | `redhat_streams` |
|`redhat_streams_zookeeper_service_name` | Zookeeper service name | `redhat_streams_zookeeper` |
|`redhat_streams_zookeeper_service_config_template` | Zookeeper template service file | `templates/service.conf.j2` |
|`redhat_streams_zookeeper_service_env_file` | Zookeeper service environment configuration file | `/etc/zookeeper.conf` |
|`redhat_streams_zookeeper_data_dir` | Zookeeper data folder | `/var/lib/{{ redhat_streams_zookeeper_service_name }}/` |
|`redhat_streams_zookeeper_logs_dir` | Zookeeper logs folder | `/var/log/{{ redhat_streams_zookeeper_service_name }}/` |
|`redhat_streams_zookeeper_max_client_cnxns` | Max client connections | `0` |
|`redhat_streams_zookeeper_admin_enable_server` | Enable zookeeper administration server | `false` |
|`redhat_streams_zookeeper_instance_count_enabled` | Count zookeeper instances | `true` |
|`redhat_streams_zookeeper_instance_count` |  | `0` |
|`redhat_streams_zookeeper_zookeeper_id` | Zookeeper variable to identify the zookeeper in a cluster | |
|`redhat_streams_zookeeper_java_opts` | Default values to apply to `KAFKA_OPTS` env variable |  |
|`redhat_streams_zookeeper_java_heap_opts` | Default values to apply to `KAFKA_HEAP_OPTS` env variable | `-Xmx512M -Xms512M` |
|`redhat_streams_zookeeper_java_performance_opts` | Default values to apply to `KAFKA_JVM_PERFORMANCE_OPTS` env variable |  |
|`redhat_streams_zookeeper_java_java_gc_log_opts` | Default values to apply to `KAFKA_GC_LOG_OPTS` env variable |  |
|`redhat_streams_zookeeper_java_jmx_opts` | Default values to apply to `KAFKA_JMX_OPTS` env variable |  |
|`redhat_streams_zookeeper_host` |  | `localhost` |
|`redhat_streams_zookeeper_port` |  | `2181` |
|`redhat_streams_firewalld_package_name` |  | `- firewalld` |
|`redhat_streams_firewalld_enabled` |  | `false` |
|`redhat_streams_zookeeper_init_limit` |  | `5` |
|`redhat_streams_zookeeper_sync_limit` |  | `2` |
|`redhat_streams_zookeeper_cluster_port_start` |  | `2888` |
|`redhat_streams_zookeeper_cluster_port_end` |  | `3888` |
|`redhat_streams_zookeeper_auth_enabled` | Enable Zookeeper authentication | `false` |
|`redhat_streams_zookeeper_auth_config` | JAAS file to set up Zookeeper authentication | `/etc/zookeeper-jaas.conf` |
|`redhat_streams_zookeeper_auth_config_template` | JAAS template for Zookeeper authentication | `templates/zookeeper-jaas.conf.j2` |
|`redhat_streams_zookeeper_inventory_group` | Identify the group of zookeeper nodes | `groups['zookeepers']` |

## Role Variables

The following are a set of required variables for the role:

| Variable | Description | Required |
|:---------|:------------|:---------|
|`redhat_streams_zookeeper_auth_user` | Zookeeper user to authenticate. Mandatory if `amq_streams_zookeeper_auth_enabled: true` | '' |
|`redhat_streams_zookeeper_auth_pass` | Zookeeper user password to authenticate. Mandatory if `redhat_streams_zookeeper_auth_enabled: true`| '' |

## License

Apache License v2.0 or later

## Author Information

* [Romain Pelisse](https://github.com/rpelisse)
* [Guido Grazioli](https://github.com/guidograzioli)
* [Roman Martin](https://github.com/rmarting)
