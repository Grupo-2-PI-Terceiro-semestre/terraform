resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = {
    Name = "${var.project_name}-public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = "us-east-1a"
  tags = {
    Name = "${var.project_name}-private-subnet"
  }
}


# Subnet privada adicional em outra AZ (us-east-1b)
resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_cidr_b
  availability_zone = "us-east-1b"
  tags = {
    Name = "${var.project_name}-private-subnet-b"
  }
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.this.id
  service_name = "com.amazonaws.us-east-1.s3"
  route_table_ids = [
    aws_route_table.public.id
  ]
  tags = {
    Name = "${var.project_name}-s3-endpoint"
  }
}

# Route table para subnet pública
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# EIP para NAT Gateway
resource "aws_eip" "nat" {
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id
  tags = {
    Name = "${var.project_name}-nat"
  }
}

# Route table para subnet privada
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.project_name}-private-rt"
  }
}

resource "aws_route" "private_nat_access" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
}

resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

# Security group público (manter apenas este)
resource "aws_security_group" "public_sg" {
  name        = "${var.project_name}-public-sg"
  description = "Allow HTTP/HTTPS ingress and SSH from my IP"
  vpc_id      = aws_vpc.this.id

  # Regra para HTTP (porta 80)
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Liberado para todos (em produção restrinja)
  }

  # Regra para HTTPS (porta 443)
  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Liberado para todos (em produção restrinja)
  }

  # Regra para SSH (opcional - apenas se precisar)
  ingress {
    description = "Allow SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Substitua pelo seu IP público
  }

  # Regra de egress (saída) padrão
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "private_sg" {
  name        = "${var.project_name}-private-sg"
  description = "Allow access from public SG and internal VPC traffic"
  vpc_id      = aws_vpc.this.id

  # Regra para tráfego interno na VPC (todos protocolos)
  ingress {
    description = "Allow all internal VPC traffic"
    from_port   = 0  # Obrigatório ser 0 quando protocol é "-1"
    to_port     = 0  # Obrigatório ser 0 quando protocol é "-1"
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr_block] # "10.0.0.0/22"
  }

  # Regra para HTTP (porta 80) - apenas do SG público
  ingress {
    description     = "Allow HTTP from public SG"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.public_sg.id]
  }

  # Regra para porta 8080 - apenas do SG público
  ingress {
    description     = "Allow 8080 from public SG"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.public_sg.id]
  }

  # Regra para MySQL (porta 3306) - apenas da VPC
  ingress {
    description = "Allow MySQL from private subnets"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.private_subnet_cidr, var.private_subnet_cidr_b] # ["10.0.2.0/24", "10.0.3.0/24"]
  }

  # Regra para SSH - apenas do SG público
  ingress {
    description     = "Allow SSH from public SG"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public_sg.id]
  }

  # Regra de egress (saída) padrão
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-private-sg"
  }
}