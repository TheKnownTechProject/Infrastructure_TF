output "vpc_id" {
  description = "ID of the custom VPC."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets."
  value       = module.vpc.public_subnet_ids
}

output "frontend_beanstalk_app_name" {
  description = "Frontend Elastic Beanstalk application name."
  value       = module.frontend_beanstalk.application_name
}

output "frontend_beanstalk_env_name" {
  description = "Frontend Elastic Beanstalk environment name."
  value       = module.frontend_beanstalk.environment_name
}

output "backend_beanstalk_app_name" {
  description = "Backend Elastic Beanstalk application name."
  value       = module.backend_beanstalk.application_name
}

output "backend_beanstalk_env_name" {
  description = "Backend Elastic Beanstalk environment name."
  value       = module.backend_beanstalk.environment_name
}

output "s3_bucket_name" {
  description = "Blog assets bucket name."
  value       = module.blog_assets_bucket.bucket_name
}

output "dynamodb_table_names" {
  description = "Map of logical DynamoDB table names to deployed table names."
  value       = module.dynamodb.table_names
}

output "frontend_security_group_id" {
  description = "Frontend Elastic Beanstalk security group ID."
  value       = module.security_groups.frontend_security_group_id
}

output "backend_security_group_id" {
  description = "Backend Elastic Beanstalk security group ID."
  value       = module.security_groups.backend_security_group_id
}
