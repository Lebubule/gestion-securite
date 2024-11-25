ue19-lab-05: Application Python utilisant une API publique

Description

Cette application Python 3 interroge une API publique pour récupérer et afficher des données. Elle peut utiliser JokesAPI pour afficher une blague. Le projet inclut la possibilité d’exécuter l’application via un conteneur Docker.

Fonctionnalités

    Interroge une API publique et affiche les résultats (ex. : une blague ou d'autres informations utiles).
    Facile à installer et à exécuter localement ou dans un conteneur Docker.
    Modularité avec les dépendances listées dans requirements.txt.

Installation et utilisation
Prérequis

    Python 3.x installé.
    Docker installé (si vous souhaitez utiliser des conteneurs).

Étapes pour exécuter l'application
Exécution locale

Clonez le repository :

    git clone https://git.helmo.be/students/secsy/q230047/gestion-de-la-securite-operationnelle.git
    cd ue19-lab-05

Installez les dépendances Python :

    pip install -r requirements.txt

Lancez l'application :

    python app.py

Exécution via Docker

Construisez l'image Docker :

    docker build -t my-python-app .

Exécutez le conteneur :

    docker run -p 5000:5000 my-python-app

Accédez à l'application sur :
    http://localhost:5000


Création des fichiers
app.py

Le fichier contient le code principal de l'application :

    import requests
    import re

    r = requests.get('https://official-joke-api.appspot.com/random_joke', auth=('user', 'pass'))

    texte = r.text
    print(texte)

    regex = r'"setup":"(.*?)","punchline":"(.*?)"'
    match = re.search(regex, texte)

    if match:
        question = match.group(1)
        punchline = match.group(2)
        print(question)
        print(punchline)



requirements.txt
Liste des dépendances Python nécessaires :

requests~=2.32.3

Dockerfile

Permet de créer une image Docker pour exécuter l'application :

    FROM python:3.9-slim
    WORKDIR /app
    COPY app.py .
    COPY requirements.txt .
    RUN pip install --no-cache-dir -r requirements.txt
    CMD ["python", "app.py"]

Leburton Axel
