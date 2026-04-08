output "bucket_id" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.main.id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.main.arn
}

output "bucket_region" {
  description = "The AWS region the bucket was created in"
  value       = aws_s3_bucket.main.region
}
