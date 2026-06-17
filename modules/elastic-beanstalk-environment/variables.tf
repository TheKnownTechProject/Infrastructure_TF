variable "app_name" {
  description = "Elastic Beanstalk application name."
  type        = string
}

variable "env_name" {
  description = "Elastic Beanstalk environment name."
  type        = string
}

variable "solution_stack_name" {
  description = "Elastic Beanstalk solution stack name."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID used by the environment."
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs used by the environment."
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID attached to the environment instances."
  type        = string
}

variable "instance_profile_name" {
  description = "EC2 instance profile name."
  type        = string
}

variable "service_role_name" {
  description = "Elastic Beanstalk service role name."
  type        = string
}

variable "environment_variables" {
  description = "Application environment variables."
  type        = map(string)
}
