module "ec2" {
  source = "./modules/ec2"

  instance_name     = var.ec2_instance_name
  instance_type     = var.ec2_instance_type
  ami               = var.ec2_ami
  availability_zone = var.ec2_availability_zone

  tags = var.common_tags
}

module "s3" {
  source = "./modules/s3"

  bucket_name         = var.s3_bucket_name
  environment         = var.environment
  versioning_enabled  = var.s3_versioning_enabled
  acl                 = var.s3_acl

  tags = var.common_tags
}

module "ecr" {
  source = "./modules/ecr"

  repository_name      = var.ecr_repository_name
  image_tag_mutability = var.ecr_image_tag_mutability
  scan_on_push         = var.ecr_scan_on_push

  tags = var.common_tags
}

module "eks" {
  source = "./modules/eks"

  cluster_name          = var.eks_cluster_name
  kubernetes_version    = var.eks_kubernetes_version
  node_group_name      = var.eks_node_group_name
  node_instance_type   = var.eks_node_instance_type
  node_desired_capacity = var.eks_node_desired_capacity
  node_min_size        = var.eks_node_min_size
  node_max_size        = var.eks_node_max_size

  tags = var.common_tags
}
