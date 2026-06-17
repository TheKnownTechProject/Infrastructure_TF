module "dynamodb" {
  source = "./modules/dynamodb"

  table_prefix                   = var.dynamodb_table_prefix
  enable_point_in_time_recovery  = var.enable_dynamodb_pitr
}
