# Intégration de Grafana avec Zabbix

## Description
Cette activité détaille l'installation de Grafana et son intégration avec Zabbix pour visualiser les métriques supervisées via des tableaux de bord avancés.

---

## 1. Prérequis
- Machine virtuelle (VM) Ubuntu configurée pour Grafana.
- Serveur Zabbix fonctionnel.

---

## 2. Étapes d'installation

### a. Création de la VM Grafana
```bash
hostnamectl set-hostname vm-grafana
sudo apt update && sudo apt upgrade -y