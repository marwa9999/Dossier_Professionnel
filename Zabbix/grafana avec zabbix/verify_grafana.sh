#!/bin/bash
# Vérification et démarrage du service Grafana

sudo systemctl status grafana-server || sudo systemctl start grafana-server

echo "Service Grafana vérifié et démarré."
