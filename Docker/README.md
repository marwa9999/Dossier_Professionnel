# Conteneurisation avec Docker

## Description de l'activité

Cette activité consiste à déployer et gérer des applications conteneurisées à l'aide de Docker et Docker Compose. Trois applications principales ont été conteneurisées : **Odoo**, **Axelor**, et **Eflyer**.

## 1. Installation de Docker et Docker Compose

### Étapes :
1. Création d'une machine virtuelle sous Ubuntu sur VMware.
2. Installation de Docker et Docker Compose :

```bash
sudo apt update
sudo apt install docker.io docker-compose -y
sudo systemctl start docker
sudo systemctl enable docker
```

3. Vérification des versions installées :

```bash
docker --version
docker-compose --version
```

---

## 2. Déploiement des applications

### **a. Déploiement de Odoo**

**Fichier `docker-compose.yml` :**
```yaml
version: '3.1'

services:
  web:
    image: odoo:17.0
    depends_on:
      - mydb
    ports:
      - "8069:8069"
    environment:
      HOST: mydb
      USER: odoo
      PASSWORD: myodoo

  mydb:
    image: postgres:15
    environment:
      POSTGRES_DB: postgres
      POSTGRES_PASSWORD: myodoo
      POSTGRES_USER: odoo
```

### **b. Déploiement de Axelor**

**Fichier `docker-compose.yml` :**
```yaml
version: '3.8'

services:
  axelor:
    image: axelor/aio-erp:latest
    container_name: axelor
    depends_on:
      - db
    ports:
      - "8080:8080"
    environment:
      DB_HOST: db
      DB_PORT: 5432
      DB_NAME: axelor
      DB_USER: axelor
      DB_PASSWORD: axelor
    volumes:
      - axelor-data:/var/lib/tomcat/webapps
      - ./axelor-config:/opt/axelor/config

  db:
    image: postgres:14
    container_name: axelor_db
    environment:
      POSTGRES_USER: axelor
      POSTGRES_PASSWORD: axelor
      POSTGRES_DB: axelor
    volumes:
      - db-data:/var/lib/postgresql/data

volumes:
  axelor-data:
  db-data:
```

### **c. Déploiement de Eflyer**

**Fichier `docker-compose.yml` :**
```yaml
version: '3.8'

services:
  nginx:
    image: nginx:latest
    volumes:
      - ./:/usr/share/nginx/html
    ports:
      - "8081:80"
```

---

## 3. Gestion des conteneurs

### Commandes principales :
- Lancer les conteneurs :
  ```bash
  docker-compose up -d
  ```

- Vérifier les conteneurs en cours d'exécution :
  ```bash
  docker ps
  ```

- Arrêter les conteneurs :
  ```bash
  docker-compose down
  ```

---

## 4. Résultats

- **Odoo** : Accessible à `http://192.168.8.138:8069`
- **Axelor** : Accessible à `http://192.168.8.138:8080`
- **Eflyer** : Accessible à `http://192.168.8.138:8081`

---

## 5. Captures d’écran

### Capture 1 : Fichier `docker-compose.yml` de Odoo


### Capture 2 : Interface utilisateur d'Odoo
https://github.com/marwa9999/Dossier_Professionnel/blob/main/Docker/image-docker/Capture1transfert-de-dossier-Eflyer-via-Filezilla.png?raw=true

### Capture 3 : Fichier `docker-compose.yml` de Axelor


### Capture 4 : Interface utilisateur de Axelor


### Capture 5 : Fichier `docker-compose.yml` de Eflyer


### Capture 6 : Interface utilisateur de Eflyer


---
