data "aws_iam_policy_document" "elastic_beanstalk_service_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["elasticbeanstalk.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "backend_app_access" {
  statement {
    sid = "DynamoDbAccess"

    actions = [
      "dynamodb:BatchGetItem",
      "dynamodb:BatchWriteItem",
      "dynamodb:ConditionCheckItem",
      "dynamodb:DeleteItem",
      "dynamodb:DescribeTable",
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:UpdateItem"
    ]

    resources = concat(
      var.dynamodb_table_arns,
      [for arn in var.dynamodb_table_arns : "${arn}/index/*"]
    )
  }

  statement {
    sid = "BucketListAccess"

    actions = ["s3:ListBucket"]

    resources = [var.s3_bucket_arn]
  }

  statement {
    sid = "BucketObjectAccess"

    actions = [
      "s3:DeleteObject",
      "s3:GetObject",
      "s3:PutObject"
    ]

    resources = ["${var.s3_bucket_arn}/*"]
  }
}

resource "aws_iam_role" "service" {
  name               = var.service_role_name
  assume_role_policy = data.aws_iam_policy_document.elastic_beanstalk_service_assume_role.json

  tags = {
    Name = var.service_role_name
  }
}

resource "aws_iam_role_policy_attachment" "service" {
  for_each = toset([
    "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth",
    "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkManagedUpdatesCustomerRolePolicy"
  ])

  role       = aws_iam_role.service.name
  policy_arn = each.value
}

resource "aws_iam_role" "frontend_instance" {
  name               = var.frontend_instance_role_name
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

  tags = {
    Name = var.frontend_instance_role_name
  }
}

resource "aws_iam_role_policy_attachment" "frontend_web_tier" {
  role       = aws_iam_role.frontend_instance.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

resource "aws_iam_instance_profile" "frontend" {
  name = "${var.frontend_instance_role_name}-profile"
  role = aws_iam_role.frontend_instance.name
}

resource "aws_iam_role" "backend_instance" {
  name               = var.backend_instance_role_name
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

  tags = {
    Name = var.backend_instance_role_name
  }
}

resource "aws_iam_role_policy_attachment" "backend_web_tier" {
  role       = aws_iam_role.backend_instance.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

resource "aws_iam_policy" "backend_app_access" {
  name   = "${var.backend_instance_role_name}-app-access"
  policy = data.aws_iam_policy_document.backend_app_access.json
}

resource "aws_iam_role_policy_attachment" "backend_app_access" {
  role       = aws_iam_role.backend_instance.name
  policy_arn = aws_iam_policy.backend_app_access.arn
}

resource "aws_iam_instance_profile" "backend" {
  name = "${var.backend_instance_role_name}-profile"
  role = aws_iam_role.backend_instance.name
}
