# Docker


Initiation Docker


## Image, Containers, Dockerfile ...

1. Une image </br>
<p></p>

2. Un Containers
<p>On pourrais être tenté de comparé un Container à une VM. Toutefois il  existe différences<br>

Un conteneur est immuable. Pour faire une modification il faut creer une nouvelle image avant de la déployé. 

Un conteneur est soit Stateless soit stateful 

<ul>
    <li>VM
        <ul>
            <li>Temps de démarage élevé</li>
            <li>Ressources réservé</li>
        </ul>
    </li>
    <li>Container
        <ul>
            <li>Isolation du processus et non d'une machine <=> démarage plus rapide</li>
            <li>Repose sur l'OS hote != un OS par VM</li>
        </ul>
    </li>
</ul>
</p>

3. Dockerfile 
C'est le fichier de configuration du conteneur docker. 

## Installation 

voir https://docs.docker.com/engine/install/ubuntu/ 

Par defaut, les images, containers, volume, etc. sont contenus dans :
>/var/lib/docker/

## Lancer un conteneur existant

pour lancer le conteneur hello-world 
> docker run hello-world

Dans les faits, docker vas rechercher un conteneur en local nommé hello-world. S'il n'en trouve pas, il cherchera un conteneur hello-world sur le web, dans dockerhub. Il s'agit d'une solution semblable à github sauf qu'ici il est question de partager des Images docker.

Pour lancer un conteneur 2048 
>docker run -d -p 8080:80 alexwhen/docker-2048

Pour visualiser les conteneur en fonction 
>docker ps

Pour arreter un conteneur
>docker stop [idConteneur]

Pour supprimer un conteneur arreté
>docker system prune

Cette commande supprimera tous les conteneurs arreté 

## Structure Dockerfile

>FROM ubuntu:18.04
>
>RUN apt-get update -yq \
&& apt-get install curl gnupg -yq \
&& curl -sL https://deb.nodesource.com/setup_10.x | bash \
&& apt-get install nodejs -yq \
&& apt-get clean -y
>
>ADD /home/brandon/projects/tptodo/ /app/
>
>WORKDIR /app
>
>EXPOSE 8080
>
>CMD npm run test

A l'instart de .gitignore il existe un .dockerignore
>node_modules
>.git
>README.md

Visualiser l'ensemble des images locales
>docker images

afin de lancer le build de son image 
>docker build -t [docker-todo] .

Connaitre les caractéristiques d'un container
>docker inspect [CONTAINER ID]