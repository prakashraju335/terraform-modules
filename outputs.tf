output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2.instance_id
}

output "ec2_instance_public_ip" {
  description = "EC2 instance public IP address"
  value       = module.ec2.instance_public_ip
}

output "ec2_instance_private_ip" {
  description = "EC2 instance private IP address"
  value       = module.ec2.instance_private_ip
}

output "s3_bucket_id" {
  description = "S3 bucket ID"
  value       = module.s3.bucket_id
}

output "s3_bucket_arn" {
  description = "S3 bucket ARN"
  value       = module.s3.bucket_arn
}

output "s3_bucket_region" {
  description = "S3 bucket region"
  value       = module.s3.bucket_region
}
