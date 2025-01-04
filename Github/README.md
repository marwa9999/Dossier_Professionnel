# Gestion des activités via GitHub

## Description de l'activité

Cette activité consiste à gérer et partager les projets des activités DevOps via un dépôt GitHub. Chaque activité est documentée et structurée dans des dossiers spécifiques pour assurer une organisation claire et professionnelle.

---

## 1. Prérequis

- Installation de Git sur la machine locale :

```bash
sudo apt update && sudo apt install git -y
```

- Création d’un compte GitHub.
- Configuration des informations utilisateur pour Git :

```bash
git config --global user.name "Votre Nom"
git config --global user.email "votre.email@example.com"
```

---

## 2. Étapes de gestion avec Git et GitHub

### a. Initialisation du dépôt local

1. Accédez au dossier de votre projet :

```bash
cd /chemin/vers/votre/projet
```

2. Initialisez un dépôt Git :

```bash
git init
```

3. Ajoutez tous les fichiers au suivi Git :

```bash
git add .
```

4. Effectuez un premier commit :

```bash
git commit -m "Initial commit avec toutes les activités"
```

---

### b. Création et configuration du dépôt GitHub

1. Créez un nouveau dépôt sur GitHub.
2. Copiez l’URL du dépôt distant (par exemple : `https://github.com/utilisateur/mon-projet.git`).
3. Configurez le dépôt distant :

```bash
git remote add origin <URL_DU_DEPOT>
```

4. Poussez les fichiers vers le dépôt distant :

```bash
git branch -M main
git push -u origin main
```

---

## 3. Structure des fichiers dans le dépôt GitHub

```plaintext
administrateur-systeme-devops/
│
├── docker/
│   └── README.md
│
├── zabbix/
│   └── README.md
│
├── wordpress/
│   └── README.md
│
├── github/
│   └── README.md
```

---

## 4. Résultats obtenus

- Toutes les activités (Zabbix, Docker, WordPress) sont organisées dans des dossiers clairs et structurés.
- Le dépôt GitHub est accessible et prêt pour le partage ou la collaboration.
- Documentation détaillée dans les fichiers `README.md` de chaque activité.

---

## 5. Commandes utiles

- Vérifier l’état des fichiers suivis par Git :

```bash
git status
```

- Voir l’historique des commits :

```bash
git log
```

- Mettre à jour le dépôt distant avec de nouveaux fichiers ou modifications :

```bash
git add .
git commit -m "Ajout de nouvelles modifications"
git push
```

---

## 6. Captures d’écran

### Capture 1 : Initialisation du dépôt Git local

Description : Commande pour initialiser un dépôt Git local.

### Capture 2 : Ajout des fichiers et premier commit
![Ajout des fichiers](file-JhaWXHC2UPGqJWanroHfth)
Description : Commandes pour ajouter les fichiers et effectuer un premier commit.

### Capture 3 : Configuration du dépôt distant
![Configuration dépôt distant](file-SiegUJFhhB9t2dbeVtA5zz)
Description : Configuration du lien avec le dépôt GitHub distant.

### Capture 4 : Poussée des fichiers vers GitHub
![Poussée vers GitHub](file-Aavw9M1Cx1Y1bEXuamtk7t)
Description : Commande pour pousser les fichiers vers le dépôt GitHub.

### Capture 5 : Vue du dépôt GitHub
![Vue dépôt GitHub](file-LjijjvtTroHqLYXyj9aUBC)
Description : Structure finale des fichiers dans le dépôt GitHub après la poussée.

---
