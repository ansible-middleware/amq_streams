# Cruise Control Role

Perform installation and configuration of Cruise Control.

| Variable | Description | Default |
|:---------|:------------|:--------|
|`amq_streams_cruise_control_home`| Path to folder where Cruise Control has been installed | `/opt/cruise-control/` |
|`amq_streams_cruise_control_service_name`| Name of the systemd service running Cruise Control | `amq_streams_cruise_control` |
|`amq_streams_cruise_control_server_start`| Path to start script for systemd service managing Cruise Control | `{{ amq_streams_cruise_control_home }}/kafka-cruise-control-start.sh` |
|`amq_streams_cruise_control_server_stop`| Path to stop script for systemd service managing Cruise Control | `{{ amq_streams_cruise_control_home }}/kafka-cruise-control-stop.sh` |
|`amq_streams_cruise_control_server_config`| Path to config file for Cruise Control service | `/etc/amq_streams_cruise_control.properties` |
|`amq_streams_cruise_control_config_template`| Path to template defining the systemd service for Cruise Control | `templates/service.conf.j2` |
|`amq_streams_cruise_control_config_properties_template`| Path to template defining the config file for Cruise Control | `templates/cruisecontrol.properties.j2` |
|`amq_streams_cruise_control_user`| User account running the Cruise Control service | `root` |
|`amq_streams_cruise_control_group`| Groupname of the account running the Cruise Control service | `root` |
|`amq_streams_cruise_control_zk_host`| Hostname of the Zookeeper instance used by Cruise Control to communicate with the ensemble | `{{ groups['zookeepers'][0] }}` |
|`amq_streams_cruise_control_broker_host`| Hostname of the Zookeeper instance used by Cruise Control to communicate with the ensemble | `{{ groups['brokers'][0] }}` |
|`amq_streams_cruise_control_host`| Name of the host system running Cruise Control | `localhost` |
|`amq_streams_cruise_control_port`| Port used communicate with Cruise Control | `9090` |
|`amq_streams_cruise_control_api_path`| Context of the HTTP API call to Cruise Control (don't modify unless you know what you are doing) | `kafkacruisecontrol` |
|`amq_streams_cruise_control_operation_exec`| Set to False to display the URL built, but do not execute it (debug) | `True` |

## License

Apache License v2.0 or later

## Author Information

* [Romain Pelisse](https://github.com/rpelisse)
