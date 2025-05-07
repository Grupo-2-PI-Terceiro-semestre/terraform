#!/bin/bash

# Atualiza os pacotes e instala dependências
sudo apt update -y
sudo apt install -y docker.io mysql-client

sudo mkdir -p /usr/local/lib/docker/cli-plugins

sudo curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose

sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

# Aguarda até o banco de dados RDS estar disponível (timeout de até 5 minutos)
for i in {1..30}; do
  echo "Verificando conexão com o banco de dados (tentativa $i)..."
  mysql -h order-hub-db.cy356uxitvhj.us-east-1.rds.amazonaws.com -u orderhub -porderhub -e "SELECT 1" order_hub && break || sleep 10
done

# Executa scripts SQL de schema e dados
mysql -h order-hub-db.cy356uxitvhj.us-east-1.rds.amazonaws.com -u orderhub -porderhub order_hub < /tmp/schema.sql
mysql -h order-hub-db.cy356uxitvhj.us-east-1.rds.amazonaws.com -u orderhub -porderhub order_hub < /tmp/data.sql

# Baixa e executa o container do back-end
sudo docker pull jonathancarvalho039/api-order-hub
sudo docker run -d -p 8080:8080 --name back-end jonathancarvalho039/api-order-hub
