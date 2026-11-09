# Usage Patterns

The AMQ Streams collection is defined with a set of different roles to automate a Kafka ecosystem
in a proper way inside Ansible playbooks, following the common practices of Ansible.

This collection is designed to be used by these guidelines:

* Each Kafka component will have its own playbook bound to its own set of hosts
* Define a playbook for each component and life cycle

The following scenarios can be implemented with this collection:

* Kafka all-in-one deployment, a playbook using the main roles (`amq_streams_zookeeper`, `amq_streams_broker`) using the same inventory of hosts (e.g.: `hosts: all`).
* Kafka distributed deployment, two different playbooks with different inventories to deploy the Zookeeper ensemble and Kafka brokers in separate hosts (e.g: `hosts: zookeeper`, `hosts: broker`)
* Kafka connect deployment, a playbook using its own inventory to deploy the Kafka Connect cluster (e.g: `hosts: kconnect`)

There is a example of each playbook in the [`playbooks`](https://github.com/ansible-middleware/amq_streams/blob/main/playbooks) folder.
