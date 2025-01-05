# Intégration de Grafana avec Zabbix

## Description de l'activité

Cette activité détaille l'installation et la configuration de Grafana pour visualiser les données collectées par Zabbix. Grafana a été installé sur une machine virtuelle dédiée et connectée à un serveur Zabbix pour offrir des tableaux de bord avancés.

---

## 1. Prérequis

- Une machine virtuelle configurée pour Grafana :
  - **Nom de la VM** : `vm-grafana`
  - **Adresse IP** : `192.168.8.137`
- Zabbix Server déjà configuré et fonctionnel.
- Accès SSH à la VM `vm-grafana`.

---

## 2. Étapes d'installation et de configuration

### a. Création de la machine virtuelle

1. **Création de la VM dans VMware** :
   - Attribuer 2 CPU, 2 Go de RAM et 20 Go de disque dur.
   - Installer Ubuntu 22.04 sur la VM.

2. **Configuration de la VM** :
   ```bash
   hostnamectl set-hostname vm-grafana
   sudo apt update && sudo apt upgrade -y
   ```

### b. Installation de Grafana

1. Installer Grafana sur la VM :
   ```bash
   sudo apt update
   sudo apt install -y grafana
   ```

2. Vérifier que le service Grafana est actif et le démarrer si nécessaire :
   ```bash
   sudo systemctl status grafana-server
   sudo systemctl start grafana-server
   sudo systemctl enable grafana-server
   ```

3. Accéder à Grafana via un navigateur web :
   - URL : `http://192.168.8.137:3000`
   - Identifiants par défaut :
     - **Utilisateur** : admin
     - **Mot de passe** : admin

### c. Installation du plugin Zabbix pour Grafana

1. Installer le plugin Zabbix :
   ```bash
   grafana-cli plugins install alexanderzobnin-zabbix-app
   sudo systemctl restart grafana-server
   ```

2. Activer le plugin dans l’interface Grafana :
   - Naviguer vers **Configuration** > **Plugins**.
   - Rechercher le plugin **Zabbix** et cliquer sur **Enable**.

### d. Connexion de Grafana à Zabbix

1. Ajouter une nouvelle source de données dans Grafana :
   - Aller dans **Configuration** > **Data Sources**.
   - Sélectionner **Zabbix**.
   - Entrer l'URL de l'API Zabbix : `http://192.168.8.136/zabbix/api_jsonrpc.php`.
   - Fournir les identifiants API de Zabbix.

2. Tester la connexion et sauvegarder.

---

## 3. Commandes utilisées

- Mise à jour et installation :
  ```bash
  sudo apt update && sudo apt upgrade -y
  sudo apt install grafana -y
  grafana-cli plugins install alexanderzobnin-zabbix-app
  sudo systemctl restart grafana-server
  ```

- Gestion du service Grafana :
  ```bash
  sudo systemctl status grafana-server
  sudo systemctl start grafana-server
  sudo systemctl enable grafana-server
  ```

---

## 4. Résultats

- Grafana est connecté à Zabbix.
- Des tableaux de bord interactifs sont créés pour surveiller les performances des systèmes supervisés.

---

## 5. Captures d’écran

### Capture 1 : Page de connexion Grafana
![Connexion Grafana](file-USsyo585eJPQzPYYE32SsS)

### Capture 2 : Plugin Zabbix dans Grafana
![Plugin Zabbix Grafana](file-UkM8ijXBshTgZfLmhvfhKa)

### Capture 3 : Tableau de bord Grafana
![Tableau de bord Grafana](file-XUqgv6AwCFk4Q7KjJ4yRcn)

---