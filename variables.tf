variable "aws_region" {
  description = "AWS region for all resources."
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project tag value."
  type        = string
  default     = "The Tech Project"
}

variable "project_slug" {
  description = "Lowercase slug used for naming resources."
  type        = string
  default     = "tech-project"
}

variable "environment" {
  description = "Environment tag value."
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the custom VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Two public subnet CIDR blocks used to avoid NAT Gateway cost."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]

  validation {
    condition     = length(var.public_subnet_cidrs) == 2
    error_message = "Exactly two public subnet CIDR blocks are required for the MVP layout."
  }
}

variable "frontend_app_name" {
  description = "Elastic Beanstalk application name for the frontend."
  type        = string
  default     = "tech-project-frontend"
}

variable "frontend_env_name" {
  description = "Elastic Beanstalk environment name for the frontend."
  type        = string
  default     = "tech-project-frontend-env"
}

variable "backend_app_name" {
  description = "Elastic Beanstalk application name for the backend."
  type        = string
  default     = "tech-project-backend"
}

variable "backend_env_name" {
  description = "Elastic Beanstalk environment name for the backend."
  type        = string
  default     = "tech-project-backend-env"
}

variable "frontend_instance_type" {
  description = "Low-cost Graviton instance type for the frontend environment."
  type        = string
  default     = "t4g.nano"
}

variable "backend_instance_type" {
  description = "Low-cost Graviton instance type for the backend environment."
  type        = string
  default     = "t4g.nano"
}

variable "frontend_solution_stack_name" {
  description = "Elastic Beanstalk solution stack for the Next.js frontend."
  type        = string
  default     = "64bit Amazon Linux 2023 v6.1.6 running Node.js 20"
}

variable "backend_solution_stack_name" {
  description = "Elastic Beanstalk solution stack for the FastAPI backend."
  type        = string
  default     = "64bit Amazon Linux 2023 v4.1.2 running Python 3.11"
}

variable "next_public_api_url" {
  description = "Public API base URL exposed to the Next.js frontend."
  type        = string
}

variable "dynamodb_table_prefix" {
  description = "Prefix added to all DynamoDB table names."
  type        = string
  default     = "tech-project-"
}

variable "enable_dynamodb_pitr" {
  description = "Enable DynamoDB point-in-time recovery. Disabled by default to keep MVP cost low."
  type        = bool
  default     = false
}

variable "blog_assets_bucket_name" {
  description = "Globally unique S3 bucket name for blog assets."
  type        = string
}

variable "enable_s3_versioning" {
  description = "Enable S3 bucket versioning. Disabled by default to keep MVP cost low."
  type        = bool
  default     = false
}

variable "frontend_allowed_origins" {
  description = "Origins allowed by S3 CORS for browser-based asset uploads and reads."
  type        = list(string)
  default     = ["*"]
}

variable "elastic_beanstalk_service_role_name" {
  description = "IAM role name used by Elastic Beanstalk service."
  type        = string
  default     = "tech-project-eb-service-role"
}

variable "frontend_instance_role_name" {
  description = "IAM role name used by frontend Beanstalk EC2 instances."
  type        = string
  default     = "tech-project-frontend-eb-ec2-role"
}

variable "backend_instance_role_name" {
  description = "IAM role name used by backend Beanstalk EC2 instances."
  type        = string
  default     = "tech-project-backend-eb-ec2-role"
}
