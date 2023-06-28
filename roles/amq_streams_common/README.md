# Common Role

Common tasks for the collection.

## Role Defaults

| Variable | Description | Default |
|:---------|:------------|:--------|
|`amq_streams_common_product_version` | Kafka version | `3.3.2` |
|`amq_streams_common_scala_version` | Scala version | `2.13` |
|`amq_streams_common_version` | Combination version | `{{ amq_streams_common_scala_version }}-{{ amq_streams_common_product_version }}` |
|`amq_streams_common_archive_file` | Kafka binary package | `kafka_{{ amq_streams_common_version }}.tgz` |
|`amq_streams_common_download_url` | Download url | `https://downloads.apache.org/kafka/{{ amq_streams_common_product_version }}/kafka_{{ amq_streams_common_version }}.tgz` |
|`amq_streams_common_download_dir` | Folder to store the downloaded binaries. This folder is located where the playbook is executed. | `/opt` |
|`amq_streams_common_install_dir` | Installation folder | `/opt` |
|`amq_streams_common_path_to_archive_file` | Path to download binary file | `{{ amq_streams_common_download_dir }}/{{ amq_streams_common_archive_file }}` |
|`amq_streams_common_prereqs_dependencies` | List of prerequisites dependencies | `tar` |
|`amq_streams_common_openjdk_version` | Java version | `17` |
|`amq_streams_common_systemd_home` | Systemd home | `/usr/lib/systemd/system'` |
|`amq_streams_common_systemd_service_config_file_template` | | `templates/service_systemd.j2` |
|`amq_streams_common_home` | Kafka home | `"{{ amq_streams_common_install_dir }}/kafka_{{ amq_streams_common_version }}/"` |
|`amq_streams_common_firewalld_package_name` | Firewalld package name | `firewalld` |
|`amq_streams_common_firewalld_enabled` | Ensure firewalld is running and configure keycloak ports | `false` |

## Role Variables

The following are a set of required variables for the role:

| Variable | Description | Required |
|:---------|:------------|:---------|

## License

Apache License v2.0 or later

## Author Information

* [Romain Pelisse](https://github.com/rpelisse)
* [Guido Grazioli](https://github.com/guidograzioli)
* [Roman Martin](https://github.com/rmarting)

