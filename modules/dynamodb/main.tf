locals {
  tables = {
    BlogsMetaData = {
      hash_key  = "pk"
      range_key = null
    }
    BlogsContents = {
      hash_key  = "pk"
      range_key = "sk"
    }
    BlogAssets = {
      hash_key  = "pk"
      range_key = "sk"
    }
    BlogAnalytics = {
      hash_key  = "pk"
      range_key = "sk"
    }
    Comments = {
      hash_key  = "pk"
      range_key = "sk"
    }
    Tags = {
      hash_key  = "pk"
      range_key = null
    }
    Categories = {
      hash_key  = "pk"
      range_key = null
    }
    Users = {
      hash_key  = "pk"
      range_key = null
    }
    MasterTables = {
      hash_key  = "pk"
      range_key = "sk"
    }
  }
}

resource "aws_dynamodb_table" "this" {
  for_each = local.tables

  name         = "${var.table_prefix}${each.key}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = each.value.hash_key
  range_key    = each.value.range_key

  attribute {
    name = each.value.hash_key
    type = "S"
  }

  dynamic "attribute" {
    for_each = each.value.range_key == null ? [] : [each.value.range_key]

    content {
      name = attribute.value
      type = "S"
    }
  }

  point_in_time_recovery {
    enabled = var.enable_point_in_time_recovery
  }

  server_side_encryption {
    enabled = true
  }

  # Add GSIs later when access patterns are stable enough to justify the cost.
  tags = {
    Name = "${var.table_prefix}${each.key}"
  }
}
