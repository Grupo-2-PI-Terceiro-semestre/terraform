# Cria o key pair na AWS usando a chave pública
resource "aws_key_pair" "generated_key" {
  key_name   = var.key_pair_name
  public_key = file("orderhub.pem.pub") # Caminho completo para o arquivo .pub
}

# Instância pública rodando um container com Nginx
resource "aws_instance" "public_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.public_sg_id]
  key_name               = aws_key_pair.generated_key.key_name

  user_data = <<-EOF
  #!/bin/bash
  sudo apt update -y
  sudo apt install docker.io -y
  sudo docker pull jonathancarvalho039/front-end-app
  sudo docker run -d -p 80:80 --name front-end-app jonathancarvalho039/front-end-app
EOF


  tags = {
    Name = "${var.project_name}-public-ec2"
  }
}


# Instância privada (opcional, sem Nginx)
resource "aws_instance" "private_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = aws_key_pair.generated_key.key_name
  private_ip = "10.0.2.192"

  user_data = <<-EOF
  #!/bin/bash
  sudo apt update -y
  sudo apt install docker.io -y
  sudo docker pull jonathancarvalho039/api-order-hub
  sudo docker run -d -p 8080:8080 --name back-end jonathancarvalho039/api-order-hub
EOF

  tags = {
    Name = "${var.project_name}-private-ec2"
  }
}
