output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.srpr_main.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.srpr_main.public_ip
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.srpr_main.private_ip
}

output "instance_arn" {
  description = "ARN of the EC2 instance"
  value       = aws_instance.srpr_main.arn
}
