output "table_names" {
  description = "Map of logical names to DynamoDB table names."
  value = {
    for logical_name, table in aws_dynamodb_table.this :
    logical_name => table.name
  }
}

output "table_arns" {
  description = "Map of logical names to DynamoDB table ARNs."
  value = {
    for logical_name, table in aws_dynamodb_table.this :
    logical_name => table.arn
  }
}
