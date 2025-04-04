module "vpc" {
  source                = "./modules/vpc"
  project_name          = var.project_name
  vpc_cidr_block        = "10.0.0.0/22" # Expandido para acomodar mais subnets
  public_subnet_cidr    = "10.0.0.0/24" # Primeira subnet pública (us-east-1a)
  private_subnet_cidr   = "10.0.2.0/24" # Primeira subnet privada (us-east-1a)
  private_subnet_cidr_b = "10.0.3.0/24" # Segunda subnet privada (us-east-1b)
}


module "s3" {
  source        = "./modules/s3"
  project_name  = var.project_name
  bucket_suffix = "images-orderhub"
}

module "rds" {
  source             = "./modules/rds"
  project_name       = var.project_name
  subnet_ids         = module.vpc.private_subnet_ids # Usando subnets privadas
  db_name            = "order_hub"
  db_username        = "orderhub"
  db_password        = "orderhub"
  security_group_ids = [module.vpc.private_sg_id] # Usando SG privado
}


module "ec2" {
  source            = "./modules/ec2"
  project_name      = var.project_name
  ami_id            = "ami-084568db4383264d4" # Atualize para sua região
  public_subnet_id  = module.vpc.public_subnet_ids[0]
  private_subnet_id = module.vpc.private_subnet_ids[0]
  public_sg_id      = module.vpc.public_sg_id
  private_sg_id     = module.vpc.private_sg_id
}
