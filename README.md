# Ansible Collection - middleware_automation.amq_streams

[![Build Status](https://github.com/ansible-middleware/amq_streams/workflows/CI/badge.svg?branch=main)](https://github.com/ansible-middleware/amq_streams/actions/workflows/ci.yml)


Collection to install ...

<!--start requires_ansible-->
## Ansible version compatibility

This collection has been tested against following Ansible versions: **>=2.9.10**.

Plugins and modules within a collection may be tested with only specific Ansible versions. A collection may contain metadata that identifies these versions.
<!--end requires_ansible-->


## Installation and Usage


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

* none at the moment


A requirement file is provided to install:

    pip install -r requirements.txt


### Included roles

* [`rolename`](https://github.com/ansible-middleware/amq_streams/tree/main/roles/rolename): performs an installation ...


## Support

amq_streams collection v1.0.0 is a Beta release and for Technical Preview. If you have any issues or questions related to collection, please don't hesitate to contact us on Ansible-middleware-core@redhat.com or open an issue on https://github.com/ansible-middleware/amq_streams/issues

## License

Apache License v2.0 or later

See [LICENSE](LICENSE) to view the full text.

