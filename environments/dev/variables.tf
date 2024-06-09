variable "s3bucketname" {
  type        = string
  description = "Name of the s3 bucket"
}

variable "Environment" {
  type        = string
  description = "Deployment environment"
}

variable "Project" {
  type        = string
  description = "Project Name"
}

variable "Application" {
  type        = string
  description = "Application Name"
}
