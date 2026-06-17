variable "table_prefix" {
  description = "Prefix added to all DynamoDB table names."
  type        = string
}

variable "enable_point_in_time_recovery" {
  description = "Enable point-in-time recovery for all tables."
  type        = bool
}
