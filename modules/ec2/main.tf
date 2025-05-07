# Cria o key pair na AWS usando a chave pública
resource "aws_key_pair" "generated_key" {
  key_name   = var.key_pair_name
  public_key = file("orderhub.pem.pub") # Caminho completo para o arquivo .pub
}

# EC2 pública que executa o front-end
resource "aws_instance" "public_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.public_sg_id]
  key_name               = aws_key_pair.generated_key.key_name
  private_ip             = "10.0.0.10"

  user_data = <<-EOF
  #!/bin/bash

  sleep 15

  cat > /tmp/instance.sh <<'SH'
  ${file("instance-front.sh")}
  SH

  chmod +x /tmp/instance.sh
  bash /tmp/instance.sh

  bash /tmp/pipe.sh

EOF

  tags = {
    Name = "${var.project_name}-public-ec2"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.public_instance.id
  allocation_id = "eipalloc-025ebb893d31bd7ec"
}

resource "aws_instance" "private_instance_primary" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = aws_key_pair.generated_key.key_name
  private_ip             = "10.0.2.192"

  user_data = <<-EOF
  #!/bin/bash
  sleep 120

  cat > /tmp/instance.sh <<'SH'
  ${file("instance-back.sh")}
  SH

  cat > /tmp/schema.sql <<'SQL'
  ${file("schema.sql")}
  SQL

  cat > /tmp/data.sql <<'SQL'
  ${file("data.sql")}
  SQL

  chmod +x /tmp/instance.sh
  sudo /tmp/instance.sh
  EOF

  tags = {
    Name = "${var.project_name}-private-ec2-primary"
  }
}

resource "aws_instance" "private_instance_secondary" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = aws_key_pair.generated_key.key_name
  private_ip             = "10.0.2.193"

  user_data = <<-EOF
  #!/bin/bash
  sleep 130

  cat > /tmp/instance.sh <<'SH'
  ${file("instance-back.sh")}
  SH

  chmod +x /tmp/instance.sh
  sudo /tmp/instance.sh
  EOF

  tags = {
    Name = "${var.project_name}-private-ec2-secondary"
  }
}



