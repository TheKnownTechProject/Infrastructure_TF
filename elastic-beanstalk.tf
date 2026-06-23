# locals {
#   frontend_environment_variables = {
#     NODE_ENV            = "production"
#     NEXT_PUBLIC_API_URL = var.next_public_api_url
#   }

#   backend_environment_variables = {
#     ENV                   = "production"
#     AWS_REGION            = var.aws_region
#     BLOG_ASSETS_BUCKET    = module.blog_assets_bucket.bucket_name
#     DYNAMODB_TABLE_PREFIX = var.dynamodb_table_prefix
#   }
# }

# module "frontend_beanstalk" {
#   source = "./modules/elastic-beanstalk-environment"

#   app_name              = var.frontend_app_name
#   env_name              = var.frontend_env_name
#   solution_stack_name   = var.frontend_solution_stack_name
#   instance_type         = var.frontend_instance_type
#   vpc_id                = module.vpc.vpc_id
#   subnet_ids            = module.vpc.public_subnet_ids
#   security_group_id     = module.security_groups.frontend_security_group_id
#   instance_profile_name = module.iam.frontend_instance_profile_name
#   service_role_name     = module.iam.service_role_name
#   environment_variables = local.frontend_environment_variables

#   depends_on = [module.iam]
# }

# module "backend_beanstalk" {
#   source = "./modules/elastic-beanstalk-environment"

#   app_name              = var.backend_app_name
#   env_name              = var.backend_env_name
#   solution_stack_name   = var.backend_solution_stack_name
#   instance_type         = var.backend_instance_type
#   vpc_id                = module.vpc.vpc_id
#   subnet_ids            = module.vpc.public_subnet_ids
#   security_group_id     = module.security_groups.backend_security_group_id
#   instance_profile_name = module.iam.backend_instance_profile_name
#   service_role_name     = module.iam.service_role_name
#   environment_variables = local.backend_environment_variables

#   depends_on = [module.iam]
# }
