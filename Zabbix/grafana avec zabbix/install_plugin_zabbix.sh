#!/bin/bash
# Installation du plugin Zabbix dans Grafana

grafana-cli plugins install alexanderzobnin-zabbix-app
sudo systemctl restart grafana-server

echo "Plugin Zabbix installé dans Grafana."
