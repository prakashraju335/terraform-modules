# Data source to get default VPC
data "aws_vpc" "default" {
  default = true
}

# Data source to get default VPC subnets
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Get the correct VPC - use provided or default
locals {
  vpc_id    = var.vpc_id != "" ? var.vpc_id : data.aws_vpc.default.id
  subnet_ids = length(var.subnet_ids) > 0 ? var.subnet_ids : data.aws_subnets.default.ids
}

# IAM Role for EKS Cluster
resource "aws_iam_role" "srpr_cluster" {
  name = "${var.cluster_name}-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "srpr_cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.srpr_cluster.name
}

# IAM Role for EKS Node Group
resource "aws_iam_role" "srpr_node_group" {
  name = "${var.cluster_name}-node-group-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "srpr_node_group_AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.srpr_node_group.name
}

resource "aws_iam_role_policy_attachment" "srpr_node_group_AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.srpr_node_group.name
}

resource "aws_iam_role_policy_attachment" "srpr_node_group_AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.srpr_node_group.name
}

# EKS Cluster
resource "aws_eks_cluster" "srpr_main" {
  name     = var.cluster_name
  role_arn = aws_iam_role.srpr_cluster.arn
  version  = var.kubernetes_version

  vpc_config {
    subnet_ids = local.subnet_ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.srpr_cluster_AmazonEKSClusterPolicy
  ]

  tags = var.tags
}

# EKS Node Group
resource "aws_eks_node_group" "srpr_main" {
  cluster_name    = aws_eks_cluster.srpr_main.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.srpr_node_group.arn
  subnet_ids      = local.subnet_ids

  scaling_config {
    desired_size = var.node_desired_capacity
    max_size     = var.node_max_size
    min_size     = var.node_min_size
  }

  instance_types = [var.node_instance_type]

  depends_on = [
    aws_iam_role_policy_attachment.srpr_node_group_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.srpr_node_group_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.srpr_node_group_AmazonEC2ContainerRegistryReadOnly,
  ]

  tags = var.tags
}