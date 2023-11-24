# Ansible Collection - middleware_automation.amq_streams

[![Build Status](https://github.com/ansible-middleware/amq_streams/workflows/CI/badge.svg?branch=main)](https://github.com/ansible-middleware/amq_streams/actions/workflows/ci.yml)

Collection to install and configure [Apache Kafka](https://kafka.apache.org/) / [Red Hat AMQ Streams](https://access.redhat.com/documentation/en-us/red_hat_amq_streams).

<!--start requires_ansible-->
## Ansible version compatibility

This collection has been tested against following Ansible versions: **>=2.9.10**.

Plugins and modules within a collection may be tested with only specific Ansible versions. A collection may contain metadata that identifies these versions.
<!--end requires_ansible-->

## Included content

### Roles

* [`amq_streams_common`](https://github.com/ansible-middleware/amq_streams/blob/main/roles/amq_streams_common/): Common tasks for the collection.
* [`amq_streams_zookeeper`](https://github.com/ansible-middleware/amq_streams/blob/main/roles/amq_streams_zookeeper/): Perform installation and configuration of Zookeeper ensemble.
* [`amq_streams_broker`](https://github.com/ansible-middleware/amq_streams/blob/main/roles/amq_streams_broker/): Perform installation and configuration of Kafka brokers cluster.
* [`amq_streams_connect`](https://github.com/ansible-middleware/amq_streams/blob/main/roles/amq_streams_connect/): Perform installation and configuration of Kafka Connect cluster.

## Installation

<!--start galaxy_download -->
### Installing the Collection from Ansible Galaxy
Before using the collection, you need to install it with the Ansible Galaxy CLI:

    ansible-galaxy collection install middleware_automation.amq_streams

You can also include it in a `requirements.yml` file and install it via `ansible-galaxy collection install -r requirements.yml`, using the format:

```yaml
---
collections:
  - name: middleware_automation.amq_streams
```

The amq_streams collection also depends on the following python packages to be present on the controller host:

* _none at the moment_

A requirement file is provided to install:

    pip install -r requirements.txt
<!--end galaxy_download -->
### Build and install locally

Clone the repository, checkout the tag you want to build, or pick the main branch for the development version; then:

    ansible-galaxy collection build .
    ansible-galaxy collection install middleware_automation-amq_streams-*.tar.gz

## Usage

### Install Playbook

* [`playbooks/playbook.yml`](https://github.com/ansible-middleware/amq_streams/blob/main/playbooks/playbook.yml) deploys based on the collections defaults.

For full service configuration details, refer to each role README file:

* [Common Role](https://github.com/ansible-middleware/amq_streams/blob/main/roles/amq_streams_common/README.md)
* [Zookeeper Role](https://github.com/ansible-middleware/amq_streams/blob/main/roles/amq_streams_zookeeper/README.md)
* [Broker Role](https://github.com/ansible-middleware/amq_streams/blob/main/roles/amq_streams_broker/README.md)
* [Connect Role](https://github.com/ansible-middleware/amq_streams/blob/main/roles/amq_streams_connect/README.md)

<!--start rhn_credentials -->
<!--end rhn_credentials -->

#### Offline installation

Making the `amq_streams_common_archive_file` archive available to the playbook working directory, and setting
`amq_streams_common_offline_install` to `True`, allows to skip the download tasks. The `amq_streams_common_download_dir` path
for the archive does match the downloaded archive path, so that it is also used as a cache when multiple hosts are
provisioned in a cluster.

```yaml
  vars:
    amq_streams_common_offline_install: true
    amq_streams_common_download_dir: "/tmp"
```

#### Install from alternate sources

It is possible to perform downloads from alternate sources (like corporate Nexus, Artifactory, proxy, etc), using the
`amq_streams_common_download_url` variable; make sure the final downloaded filename matches with the source filename
described by the `amq_streams_common_archive_file` variable (ie. *kafka_-a.b.c-x.y.z.tgz*).

<!--start support -->
For Red Hat customers, this collection is released as a [Technology Preview](https://access.redhat.com/support/offerings/techpreview) feature as the [Red Hat Ansible certified content collection for AMQ Streams](https://console.redhat.com/ansible/automation-hub/repo/published/redhat/amq_streams). If you have any issues or questions related to this collection, please contact <Ansible-middleware-core@redhat.com> or open an issue at https://github.com/ansible-middleware/amq_streams/issues.
<!--end support -->

## License

Apache License v2.0 or later

See [LICENSE](LICENSE) to view the full text.

