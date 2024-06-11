output "s3_bucket_name" {
  value = aws_s3_bucket.myS3Bucket.id
  description = "Name of the s3 bucket"
}