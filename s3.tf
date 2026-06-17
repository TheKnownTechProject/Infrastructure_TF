module "blog_assets_bucket" {
  source = "./modules/s3"

  bucket_name              = var.blog_assets_bucket_name
  enable_versioning        = var.enable_s3_versioning
  frontend_allowed_origins = var.frontend_allowed_origins
}
