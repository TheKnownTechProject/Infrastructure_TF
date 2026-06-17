module "security_groups" {
  source = "./modules/security-groups"

  project_slug = var.project_slug
  vpc_id       = module.vpc.vpc_id
}
