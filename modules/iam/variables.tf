variable "service_role_name" {
  description = "Elastic Beanstalk service role name."
  type        = string
}

variable "frontend_instance_role_name" {
  description = "Frontend EC2 role name."
  type        = string
}

variable "backend_instance_role_name" {
  description = "Backend EC2 role name."
  type        = string
}

variable "s3_bucket_arn" {
  description = "S3 bucket ARN used by the backend."
  type        = string
}

variable "dynamodb_table_arns" {
  description = "DynamoDB table ARNs used by the backend."
  type        = list(string)
}
