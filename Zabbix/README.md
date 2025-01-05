# Supervision des systèmes avec Zabbix

## Description de l'activité

Cette activité consiste à configurer Zabbix pour la supervision des systèmes et services sur plusieurs machines virtuelles, y compris `vm-ansible`, `node-001`, `node-002`, et Docker.

---

## 1. Prérequis

- Machine virtuelle hébergeant le serveur Zabbix.
- Installer zabbix sur ubuntu 22.04
https://www.zabbix.com/download?zabbix=6.4&os_distribution=ubuntu&os_version=22.04&components=server_frontend_agent&db=mysql&ws=apache 
- Installer mariadb 
https://shape.host/resources/comment-installer-la-derniere-version-de-mariadb-sur-ubuntu-22-04#:~:text=MariaDB%20n'est%20pas%20inclus,de%20MariaDB%20%C3%A0%20votre%20syst%C3%A8me.&text=Remplacez%2010.6%20par%20la%20version%20sp%C3%A9cifique%20de%20MariaDB%20que%20vous%20souhaitez%20installer. 
- Install Zabbix agent pour toutes les machines:
https://www.zabbix.com/download?zabbix=6.4&os_distribution=ubuntu&os_version=22.04&components=agent&db=&ws=


- Zabbix Agent installé sur les hôtes supervisés :
  - **vm-ansible** : 192.168.8.130
  - **node-001** : 192.168.8.131
  - **node-002** : 192.168.8.135
  - **Docker** : 192.168.8.138

---

## 2. Étapes d'installation

### a. Installation de Zabbix Server

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-agent -y
```

### b. Configuration de Zabbix Server

1. Configurer la base de données MySQL pour Zabbix :

```bash
sudo mysql -u root -p
CREATE DATABASE zabbix CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
CREATE USER 'zabbix'@'localhost' IDENTIFIED BY 'zabbix_password';
GRANT ALL PRIVILEGES ON zabbix.* TO 'zabbix'@'localhost';
FLUSH PRIVILEGES;
exit;
```

2. Importer le schéma de base de données :

```bash
zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p zabbix
```

3. Modifier le fichier de configuration du serveur Zabbix :

```bash
sudo nano /etc/zabbix/zabbix_server.conf
DBPassword=zabbix_password
```

4. Démarrer les services Zabbix :

```bash
sudo systemctl restart zabbix-server zabbix-agent apache2
sudo systemctl enable zabbix-server zabbix-agent apache2
```

---

### c. Installation des Zabbix Agents

Sur chaque hôte supervisé (`vm-ansible`, `node-001`, `node-002`, `Docker`) :

```bash
sudo apt update && sudo apt install zabbix-agent -y
sudo nano /etc/zabbix/zabbix_agentd.conf
# Modifier les paramètres :
# Server=192.168.8.136
# ServerActive=192.168.8.136
# Hostname=<Nom de la machine>

sudo systemctl restart zabbix-agent
sudo systemctl enable zabbix-agent
```

---

## 3. Supervision des services

### a. Supervision HTTP

1. Création d’un élément HTTP :
   - Accéder à l’interface Zabbix.
   - Ajouter un hôte supervisé.
   - Configurer un élément HTTP pour vérifier la disponibilité d’un site web.

2. Ajouter un déclencheur pour alerter en cas d’indisponibilité HTTP.

### b. Supervision FTP et SSH

- Ajouter des éléments similaires pour les services FTP et SSH avec des déclencheurs pour surveiller leur disponibilité.

---

## 4. Commandes utiles

- Vérifier l’état des agents Zabbix :

```bash
systemctl status zabbix-agent
```

- Tester les connexions Zabbix avec Telnet :

```bash
telnet <IP_de_la_machine> 10050
```

- Configurer le pare-feu pour Zabbix :

```bash
sudo ufw allow 10050/tcp
sudo ufw reload
```

---

## 5. Résultats

- Les métriques CPU, RAM, et espace disque des machines supervisées sont visibles sur le tableau de bord Zabbix.
- Les déclencheurs HTTP, FTP, et SSH alertent en cas de problème de service.

---

## 6. Captures d’écran

### Capture 1 : Tableau de bord global

Description : Vue d’ensemble des métriques clés et des problèmes signalés par Zabbix.

### Capture 2 : Configuration de l’hôte Node-001

Description : Configuration des paramètres d’hôte pour Node-001 dans l’interface Zabbix.

### Capture 3 : Déclencheur HTTP indisponible

Description : Déclencheur configuré pour signaler les indisponibilités HTTP.

### Capture 4 : Liste des hôtes supervisés

Description : Vue des hôtes supervisés dans Zabbix, incluant Docker, Node-001, et VM-Ansible.

### Capture 5 : Problème résolu sur Docker

Description : Notification de résolution d’un problème pour un conteneur Docker.

---
