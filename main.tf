terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

locals {
  common_tags = {
    Project     = var.project_name
  }

  availability_zones = [
    "ap-south-1a",
    "ap-south-1b",
  ]
}
