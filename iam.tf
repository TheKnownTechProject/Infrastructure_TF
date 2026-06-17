module "iam" {
  source = "./modules/iam"

  service_role_name            = var.elastic_beanstalk_service_role_name
  frontend_instance_role_name  = var.frontend_instance_role_name
  backend_instance_role_name   = var.backend_instance_role_name
  s3_bucket_arn                = module.blog_assets_bucket.bucket_arn
  dynamodb_table_arns          = values(module.dynamodb.table_arns)
}
