# terraform.tfvars
# Variable overrides for your Terraform deployment

aws_region = "ap-south-1"
environment = "dev"

# EC2 Configuration
ec2_instance_name      = "srpr-web-server"
ec2_instance_type      = "t2.micro"
ec2_availability_zone  = "ap-south-1a"

# S3 Configuration
s3_bucket_name         = "srpr-terraform-bucket-2026-04-08"
s3_versioning_enabled  = false
s3_acl                 = "private"

# ECR Configuration
ecr_repository_name      = "srpr-app-repo"
ecr_image_tag_mutability = "MUTABLE"
ecr_scan_on_push         = true

# EKS Configuration (uses default VPC and subnets)
eks_cluster_name          = "srpr-eks-cluster"
eks_kubernetes_version    = "1.28"
eks_node_group_name       = "srpr-node-group"
eks_node_instance_type    = "t3.medium"
eks_node_desired_capacity = 2
eks_node_min_size         = 1
eks_node_max_size         = 3

# Common Tags
common_tags = {
  Project     = "TerraformModules"
  ManagedBy   = "Terraform"
  Environment = "dev"
}