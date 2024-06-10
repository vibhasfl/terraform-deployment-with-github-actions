variable "s3bucketname" {
  type        = string
  description = "Name of the s3 bucket"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default     = {}
}

variable "s3bucketversioning" {
  type        = string
  description = "Bucket versioning"
  default     = "Enabled"
}
