variable "project_slug" {
  description = "Lowercase slug used for naming security groups."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security groups are created."
  type        = string
}
