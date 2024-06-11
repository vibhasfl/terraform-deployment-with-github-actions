module "s3Module" {
  source       = "../../modules/s3"
  s3bucketname = var.s3bucketname
  tags = {
    Environment = var.Environment
    Application = var.Application
    Project     = var.Project
  }
}