variable "project_name" {
  type        = string
  description = "Order Hub"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR da VPC"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR da Subnet Pública"
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR da Subnet Privada"
}

variable "private_subnet_cidr_b" {
  type        = string
  description = "CIDR da Subnet Privada"
}
