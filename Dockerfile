# Étape 1 : Choisir une image de base contenant Python
FROM python:3.9-slim

# Étape 2 : Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Étape 3 : Copier les fichiers nécessaires dans le conteneur
COPY app.py .  
COPY requirements.txt .  

# Étape 4 : Installer les dépendances nécessaires
RUN pip install --no-cache-dir -r requirements.txt

# Étape 5 : Exposer le port utilisé par l'application (si applicable)
EXPOSE 5000

# Étape 6 : Définir la commande d'exécution de l'application
CMD ["python", "app.py"]
