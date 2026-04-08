variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    Project     = "TerraformModules"
    ManagedBy   = "Terraform"
  }
}

# EC2 Variables
variable "ec2_instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "my-ec2-instance"
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ec2_ami" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 in us-east-1
}

variable "ec2_availability_zone" {
  description = "Availability zone for EC2 instance"
  type        = string
  default     = "us-east-1a"
}

# S3 Variables
variable "s3_bucket_name" {
  description = "Name of the S3 bucket (must be globally unique)"
  type        = string
}

variable "s3_versioning_enabled" {
  description = "Enable versioning on the S3 bucket"
  type        = bool
  default     = false
}

variable "s3_acl" {
  description = "Access control list for S3 bucket"
  type        = string
  default     = "private"
}
