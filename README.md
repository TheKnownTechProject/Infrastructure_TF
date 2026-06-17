# The Tech Project Terraform

This Terraform stack provisions a low-cost AWS MVP footprint for **The Tech Project** using reusable modules instead of placing all resources in a single file.

## What gets created

- A custom VPC with two public subnets, an internet gateway, and a public route table
- Security groups for public frontend and backend Elastic Beanstalk environments
- One S3 bucket for blog assets with encryption, blocked public access, optional versioning, and CORS
- Nine DynamoDB tables using on-demand billing and server-side encryption
- IAM roles and instance profiles for Elastic Beanstalk, including least-privilege backend access to S3 and DynamoDB
- Two single-instance Elastic Beanstalk environments:
  - Next.js frontend on Node.js
  - FastAPI backend on Python

## Why this is low cost

- Only public subnets are created, so there is no NAT Gateway cost
- Elastic Beanstalk uses `SingleInstance`, which avoids an Application Load Balancer
- DynamoDB uses `PAY_PER_REQUEST`
- S3 versioning and DynamoDB point-in-time recovery are configurable and disabled by default

## Module layout

```text
terraform/
  main.tf
  providers.tf
  variables.tf
  outputs.tf
  vpc.tf
  security-groups.tf
  iam.tf
  s3.tf
  dynamodb.tf
  elastic-beanstalk.tf
  terraform.tfvars.example
  modules/
    dynamodb/
    elastic-beanstalk-environment/
    iam/
    s3/
    security-groups/
    vpc/
```

## Configuration

1. Copy `terraform.tfvars.example` to `terraform.tfvars`.
2. Set a globally unique `blog_assets_bucket_name`.
3. Set `next_public_api_url` to the public backend URL.
4. Adjust the Elastic Beanstalk solution stack names if your target region exposes different platform versions.

## Commands

```bash
terraform init
terraform plan
terraform apply
```

To destroy the stack:

```bash
terraform destroy
```

## Notes

- Elastic Beanstalk application code packaging and deployment are separate from this infrastructure unless you add deployment artifacts yourself.
- NAT Gateway, private subnets, ALB, RDS, CloudFront, and WAF are intentionally excluded to keep the MVP cost low.
- The backend security group is public for MVP simplicity. Tighten it later so only the frontend can reach it.
