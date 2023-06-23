# Zookeeper Role

Perform installation and configuration of Zookeeper ensemble.

This role requires to have a `zookeepers` group in the inventory file to identify
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
|`amq_streams_zookeeper_enabled` | Enable zookeeper ensemble | `true` |
|`amq_streams_zookeeper_config` | Zookeeper configuration file | `/etc/amq_streams_zookeeper.properties` |
|`amq_streams_zookeeper_config_template` | Zookeeper template configuration file | `templates/zookeeper.properties.j2` |
|`amq_streams_zookeeper_server_start` | Zookeeper server start file | `{{ amq_streams_common_home }}/bin/zookeeper-server-start.sh` |
|`amq_streams_zookeeper_user` | Zookeeper user | `amq_streams_zookeeper` |
|`amq_streams_zookeeper_group` | User group | `amq_streams` |
|`amq_streams_zookeeper_service_name` | Zookeeper service name | `amq_streams_zookeeper` |
|`amq_streams_zookeeper_service_config_template` | Zookeeper template service file | `templates/service.conf.j2` |
|`amq_streams_zookeeper_service_env_file` | Zookeeper service environment configuration file | `/etc/zookeeper.conf` |
|`amq_streams_zookeeper_data_dir` | Zookeeper data folder | `/var/run/zookeeper` |
|`amq_streams_zookeeper_logs_dir` | Zookeeper logs foler | `/var/logs/{{ amq_streams_zookeeper_service_name }}/` |
|`amq_streams_zookeeper_max_client_cnxns` | Max client connections | `0` |
|`amq_streams_zookeeper_admin_enable_server` | Enable zookeeper administration server | `false` |
|`amq_streams_zookeeper_instance_count_enabled` | Count zookeeper instances | `true` |
|`amq_streams_zookeeper_instance_count` |  | `0` |
|`amq_streams_zookeeper_host` |  | `localhost` |
|`amq_streams_zookeeper_port` |  | `2181` |
|`amq_streams_firewalld_package_name` |  | `- firewalld` |
|`amq_streams_firewalld_enabled` |  | `false` |
|`amq_streams_zookeeper_init_limit` |  | `5` |
|`amq_streams_zookeeper_sync_limit` |  | `2` |
|`amq_streams_zookeeper_cluster_port_start` |  | `2888` |
|`amq_streams_zookeeper_cluster_port_end` |  | `3888` |
|`amq_streams_zookeeper_auth_enabled` | Enable Zookeeper authentication | `false` |
|`amq_streams_zookeeper_auth_config` | JAAS file to set up Zookeeper authentication | `/etc/zookeeper-jaas.conf` |
|`amq_streams_zookeeper_auth_config_template` | JAAS template for Zookeeper authentication | `templates/zookeeper-jaas.conf.j2` |

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
