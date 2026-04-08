output "bucket_id" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.srpr_main.id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.srpr_main.arn
}

output "bucket_region" {
  description = "The AWS region the bucket was created in"
  value       = aws_s3_bucket.srpr_main.region
}
