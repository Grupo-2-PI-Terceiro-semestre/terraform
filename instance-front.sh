#!/bin/bash

# Atualiza os pacotes e instala dependências
sudo apt update -y
sudo apt install -y jq docker.io

sudo mkdir -p /usr/local/lib/docker/cli-plugins

sudo curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose

sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

# Baixa e roda o front-end via Docker
sudo docker pull jonathancarvalho039/front-end-app
sudo docker run -d -p 80:80 --name front-end-app jonathancarvalho039/front-end-app