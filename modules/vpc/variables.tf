variable "project_slug" {
  description = "Lowercase slug used for naming VPC resources."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets."
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones used for the public subnets."
  type        = list(string)
}
