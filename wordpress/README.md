# Déploiement de WordPress avec Ansible

## Description de l'activité

Cette activité porte sur l'automatisation du déploiement de WordPress sur deux machines virtuelles (`node-001` et `node-002`) à l'aide d'Ansible. Une machine `vm-ansible` a été utilisée pour exécuter les playbooks et gérer les hôtes cibles.

---

## 1. Prérequis

- Trois machines virtuelles (VM) configurées :
  - **vm-ansible** : Hôte de contrôle (Ansible).
  - **node-001** : Serveur cible.
  - **node-002** : Serveur cible.
- Ansible installé sur `vm-ansible` :

```bash
sudo apt update && sudo apt install ansible -y
```

- Connexion SSH configurée entre `vm-ansible` et les nœuds cibles (`node-001` et `node-002`).

---

## 2. Fichiers de configuration

### a. Inventaire (INI format)

```ini
[wordpress]
192.168.8.131 user=node1 user_passwd=node1aqfddt223 mysql_password=my1aqfddt223 domain="192.168.8.131" user_url="http://{{ domain }}/"
192.168.8.135 user=node2 user_passwd=node2aqfddt223 mysql_password=my2aqfddt223 domain="192.168.8.135" user_url="http://{{ domain }}/"

[wordpress:vars]
user_title="'Mon blog'"
```

### b. Playbook `install.yml`

```yaml
---
- name: install Wordpress
  hosts: wordpress
  gather_facts: false
  remote_user: root

  roles:
    - serveur
    - mysql
    - wp_cli
```

### c. Rôles

#### `roles/serveur/tasks/main.yaml`
```yaml
---
- name: apt-get update/upgrade
  apt:
    update_cache: yes
    upgrade: 'yes'
    cache_valid_time: 84600

- name: Install a list of packages
  apt:
    pkg:
    - apache2
    - mysql-server
    - python3-mysqldb
    - php
    - php-mysql
    - php-mbstring
    - libapache2-mod-php

- name: Restart Apache
  service:
    name: apache2
    state: restarted
```

#### `roles/wp_cli/tasks/main.yaml`
```yaml
---
- name: Télécharger WP-CLI
  get_url:
    url: "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
    dest: "/usr/local/bin/wp"
    mode: '0755'

- name: Installer WordPress avec WP-CLI
  command: >
    wp core install
    --path=/var/www/html
    --url="{{ domain }}"
    --title="{{ user_title }}"
    --admin_user=admin
    --admin_password=admin_password
    --admin_email=admin@example.com
  args:
    chdir: /var/www/html

- name: Configurer les permissions du répertoire WordPress
  file:
    path: /var/www/html
    state: directory
    owner: www-data
    group: www-data
    mode: '0755'
  notify: redémarrer Apache
```

---

## 3. Commandes utilisées

1. Lancer le Playbook :

```bash
ansible-playbook -i inventory install.yml
```

2. Vérifier les connexions Ansible :

```bash
ansible all -m ping
```

---

## 4. Résultats

- **Node-001** : WordPress est accessible à `http://192.168.8.131`
- **Node-002** : WordPress est accessible à `http://192.168.8.135`

---

## 5. Captures d’écran

### Capture 1 : Exécution du Playbook sur vm-ansible
https://github.com/marwa9999/Dossier_Professionnel/blob/main/wordpress/images-wordpress/Capture1-Ex%C3%A9cution-du-Playbook-Ansible-sur-%60vm-ansible%60.png

### Capture 2 : Interface WordPress sur Node-001
https://github.com/marwa9999/Dossier_Professionnel/blob/main/wordpress/images-wordpress/Capture2%20-Vue%20du%20site-WordPress-sur-%60node-001.png


### Capture 3 : Interface WordPress sur Node-002
https://github.com/marwa9999/Dossier_Professionnel/blob/main/wordpress/images-wordpress/Capture-3-Vue-du-site-WordPress-sur-%60node-002%60%20(Connexion)%20.png

### Capture 4 : Tableau-de-bord-WordPress-sur-`node-002
https://github.com/marwa9999/Dossier_Professionnel/blob/main/wordpress/images-wordpress/Capture4%20-Tableau-de-bord-WordPress-sur-%60node-002%60.png

### Capture 5 : Tableau-de-bord-WordPress-sur-`node-001
https://github.com/marwa9999/Dossier_Professionnel/blob/main/wordpress/images-wordpress/Capture5-Tableau-de-bord-WordPress-sur-%60node-001.png

---
