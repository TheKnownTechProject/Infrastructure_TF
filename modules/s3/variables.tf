variable "bucket_name" {
  description = "Globally unique S3 bucket name."
  type        = string
}

variable "enable_versioning" {
  description = "Enable bucket versioning."
  type        = bool
  default     = false
}

variable "frontend_allowed_origins" {
  description = "Origins allowed by the bucket CORS configuration."
  type        = list(string)
}
