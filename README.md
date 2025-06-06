
# 🎫 Ticketing App

Application de gestion de tickets développée avec Ruby on Rails. Elle permet aux utilisateurs de créer, suivre et gérer des tickets d'incident ou de support via une interface web simple et efficace.

🔗 Démo en ligne : [ticket.chocot.be](https://ticket.chocot.be)

## 🚀 Fonctionnalités

- Création de tickets avec titre, description et statut
- Attribution des tickets à des utilisateurs
- Suivi de l'état des tickets (ouvert, en cours, résolu, fermé)
- Interface utilisateur responsive
- Authentification des utilisateurs
- Gestion des rôles (utilisateur, administrateur)

## 🛠️ Technologies utilisées

- **Ruby on Rails** (framework principal)
- **PostgreSQL** (base de données)
- **Hotwire** (Turbo + Stimulus) pour des interactions dynamiques sans JavaScript personnalisé
- **Docker** pour le déploiement et l'environnement de développement
- **Kamal** pour l'orchestration du déploiement

## 📦 Installation

### Prérequis

- Ruby 3.x
- Rails 7.x
- SQLite3
- Docker (optionnel mais recommandé)

### Étapes

1. Clonez le dépôt :

   ```bash
   git clone https://github.com/benoitchocot/ticketing.git
   cd ticketing
   ```

2. Installez les dépendances Ruby :

   ```bash
   bundle install
   ```
 
3. Configurez la base de données :

   ```bash
   rails db:setup
   ```

4. Lancez le serveur :

   ```bash
   rails server
   ```

6. Accédez à l'application sur [http://localhost:3000](http://localhost:3000)

## 🤵‍♂️ Utilisateurs de test

Administrateur : admin@example.com password

Utilisateur :  user1@example.com password123


## 🐳 Utilisation avec Docker

Pour démarrer l'application avec Docker :

```bash
docker-compose up --build
```

Cela lancera l'application sur [http://localhost:3000](http://localhost:3000)

## 🧪 Tests

L'application utilise MiniTest pour les tests.

Pour exécuter la suite de tests :

```bash
rails test
```

## 📂 Structure du projet

- `app/` : Contient les modèles, contrôleurs et vues
- `config/` : Fichiers de configuration de l'application
- `db/` : Migrations et schéma de la base de données
- `lib/tasks/` : Tâches Rake personnalisées
- `Dockerfile` et `docker-compose.yml` : Configuration Docker
- `erd.pdf` : Diagramme de la base de données

## 📜 Licence

Ce projet est sous licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus d'informations.
