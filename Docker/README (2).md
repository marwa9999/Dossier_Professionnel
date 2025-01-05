# Conteneurisation avec Docker

## Description de l'activité
Cette activité consiste à déployer et gérer des applications conteneurisées à l'aide de Docker et Docker Compose. Trois applications principales ont été conteneurisées : **Odoo**, **Axelor**, et **Eflyer**.

---

## 1. Installation de Docker et Docker Compose

Pour configurer Docker et Docker Compose sur une machine virtuelle Ubuntu, suivez les étapes détaillées ici :  
[Installer Docker et Docker Compose sur Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

### Étapes supplémentaires :
1. Une fois Docker installé, démarrez et activez le service :
    ```bash
    sudo systemctl start docker
    sudo systemctl enable docker
    ```

2. Vérifiez les versions installées pour confirmer l'installation :
    ```bash
    docker --version
    docker-compose --version
    ```
## 2. Déploiement des applications

### a. Déploiement de Odoo
**Fichier :** `docker-compose/odoo-compose.yml`

### b. Déploiement de Axelor
**Fichier :** `docker-compose/axelor-compose.yml`

### c. Déploiement de Eflyer
**Fichier :** `docker-compose/eflyer-compose.yml`

---

## 3. Gestion des conteneurs

- Lancer les conteneurs :
    ```bash
    bash scripts/manage_containers.sh up
    ```

- Arrêter les conteneurs :
    ```bash
    bash scripts/manage_containers.sh down
    ```

---

## 4. Résultats

- **Odoo** : Accessible à `http://192.168.8.138:8069`
- **Axelor** : Accessible à `http://192.168.8.138:8080`
- **Eflyer** : Accessible à `http://192.168.8.138:8081`

---

## 5. Captures d’écran


### Capture 1 : transfert des fichiers via Filezilla
https://github.com/marwa9999/Dossier_Professionnel/blob/main/Docker/image-docker/Capture1transfert-de-dossier-Eflyer-via-Filezilla.png

### Capture 2 : Fichier `docker-compose.yml` Eflyer
https://github.com/marwa9999/Dossier_Professionnel/blob/main/Docker/image-docker/Capture2-Configuration-Docker-Compose-pour%20eFlyer%20.png

### Capture 3 : Interface Eflyer déployé
https://github.com/marwa9999/Dossier_Professionnel/blob/main/Docker/image-docker/Capture3-Site-eFlyer-d%C3%A9ploy%C3%A9.png

### Capture 4 : Fichier `docker-compose.yml` de Eflyer
https://github.com/marwa9999/Dossier_Professionnel/blob/main/Docker/image-docker/Capture4%20-Configuration-Docker-Compose-pour-Axelor.png

### Capture 5 : Interface Axelor déployé
https://github.com/marwa9999/Dossier_Professionnel/blob/main/Docker/image-docker/Capture5-Site-Axelor-d%C3%A9ploy%C3%A9.png

### Capture 6 : Fichier `docker-compose.yml` d'odoo
https://github.com/marwa9999/Dossier_Professionnel/blob/main/Docker/image-docker/Capture6-Configuration-Docker-Compose-pour-Odoo.png

### Capture 7 : Interface Odoo déployée
https://github.com/marwa9999/Dossier_Professionnel/blob/main/Docker/image-docker/Capture7-Interface-Odoo-d%C3%A9ploy%C3%A9e.png

---

