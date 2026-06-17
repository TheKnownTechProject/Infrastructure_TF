module "vpc" {
  source = "./modules/vpc"

  project_slug         = var.project_slug
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  availability_zones   = local.availability_zones
}
