sudo apt update -y
sudo apt install -y docker.io mysql-client

for i in {1..30}; do
  sudo mysql -h order-hub-db.cy356uxitvhj.us-east-1.rds.amazonaws.com -u orderhub -porderhub -e "SELECT 1" order_hub && break || sleep 10
done

sudo mysql -h order-hub-db.cy356uxitvhj.us-east-1.rds.amazonaws.com -u orderhub -porderhub order_hub < /tmp/schema.sql

sudo mysql -h order-hub-db.cy356uxitvhj.us-east-1.rds.amazonaws.com -u orderhub -porderhub order_hub < /tmp/data.sql

sudo docker pull jonathancarvalho039/api-order-hub

sudo docker run -d -p 8080:8080 --name back-end jonathancarvalho039/api-order-hub