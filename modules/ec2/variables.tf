variable "project_name" {
  type        = string
  description = "Order Hub"
}

variable "ami_id" {
  type        = string
  description = "ID da AMI"
  default     = "ami-084568db4383264d4 " # Amazon Linux 2 (atualize conforme sua região)
}

variable "instance_type" {
  type        = string
  description = "Tipo da instância"
  default     = "t2.micro"
}

variable "public_subnet_id" {
  type        = string
  description = "ID da subnet pública"
}

variable "private_subnet_id" {
  type        = string
  description = "ID da subnet privada"
}

variable "public_sg_id" {
  type        = string
  description = "ID do security group público"
}

variable "private_sg_id" {
  type        = string
  description = "ID do security group privado"
}

variable "key_pair_name" {
  type        = string
  description = "Nome do par de chaves SSH"
  default     = "orderhub"  # Pode alterar se quiser
}