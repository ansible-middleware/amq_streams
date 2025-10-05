# Cruise Control Role

Perform installation and configuration of Cruise Control.

| Variable | Description | Default |
|:---------|:------------|:--------|
|`redhat_streams_cruise_control_home`| Path to folder where Cruise Control has been installed | `/opt/cruise-control/` |
|`redhat_streams_cruise_control_service_name`| Name of the systemd service running Cruise Control | `redhat_streams_cruise_control` |
|`redhat_streams_cruise_control_server_start`| Path to start script for systemd service managing Cruise Control | `{{ redhat_streams_cruise_control_home }}/kafka-cruise-control-start.sh` |
|`redhat_streams_cruise_control_server_stop`| Path to stop script for systemd service managing Cruise Control | `{{ redhat_streams_cruise_control_home }}/kafka-cruise-control-stop.sh` |
|`redhat_streams_cruise_control_server_config`| Path to config file for Cruise Control service | `/etc/redhat_streams_cruise_control.properties` |
|`redhat_streams_cruise_control_config_template`| Path to template defining the systemd service for Cruise Control | `templates/service.conf.j2` |
|`redhat_streams_cruise_control_config_properties_template`| Path to template defining the config file for Cruise Control | `templates/cruisecontrol.properties.j2` |
|`redhat_streams_cruise_control_user`| User account running the Cruise Control service | `root` |
|`redhat_streams_cruise_control_group`| Groupname of the account running the Cruise Control service | `root` |
|`redhat_streams_cruise_control_zk_host`| Hostname of the Zookeeper instance used by Cruise Control to communicate with the ensemble | `{{ groups['zookeepers'][0] }}` |
|`redhat_streams_cruise_control_broker_host`| Hostname of the broker instance used by Cruise Control to communicate with the ensemble | `{{ groups['brokers'][0] }}` |
|`redhat_streams_cruise_control_host`| Name of the host system running Cruise Control | `localhost` |
|`redhat_streams_cruise_control_port`| Port used to communicate with Cruise Control | `9090` |
|`redhat_streams_cruise_control_api_path`| Context of the HTTP API call to Cruise Control (don't modify unless you know what you are doing) | `kafkacruisecontrol` |
|`redhat_streams_cruise_control_operation_exec`| Set to False to display the URL built, but do not execute it (debug) | `True` |


## License

Apache License v2.0 or later

## Author Information

* [Romain Pelisse](https://github.com/rpelisse)
