variable "aws_region" {
  type        = string
  description = "Região AWS onde os recursos serão criados"
  default     = "us-east-1"
}

variable "project_name" {
  type        = string
  description = "Nome do projeto, usado como prefixo em recursos"
  default     = "order-hub"
}
