# Cria o key pair na AWS usando a chave pública
resource "aws_key_pair" "generated_key" {
  key_name   = var.key_pair_name
  public_key = file("orderhub.pem.pub")  # Caminho completo para o arquivo .pub
}

resource "aws_instance" "public_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.public_sg_id]
  key_name               = aws_key_pair.generated_key.key_name  # Referencia o key pair criado
  tags = {
    Name = "${var.project_name}-public-ec2"
  }
}

resource "aws_instance" "private_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.private_sg_id]
  key_name               = aws_key_pair.generated_key.key_name  # Mesma chave para ambas

  tags = {
    Name = "${var.project_name}-private-ec2"
  }
}