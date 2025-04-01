variable "project_name" {
  type        = string
  description = "Nome do projeto"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Lista de subnets privadas"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Lista de security groups para o RDS"
}

variable "db_name" {
  type        = string
  description = "Nome do database"
}

variable "db_username" {
  type        = string
  description = "Usuário do DB"
}

variable "db_password" {
  type        = string
  description = "Senha do DB"
  sensitive   = true
}
