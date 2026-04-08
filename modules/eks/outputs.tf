output "cluster_id" {
  description = "The ID of the EKS cluster"
  value       = aws_eks_cluster.srpr_main.id
}

output "cluster_arn" {
  description = "The ARN of the EKS cluster"
  value       = aws_eks_cluster.srpr_main.arn
}

output "cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  value       = aws_eks_cluster.srpr_main.endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = aws_eks_cluster.srpr_main.certificate_authority[0].data
}

output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.srpr_main.name
}

output "node_group_id" {
  description = "The ID of the EKS node group"
  value       = aws_eks_node_group.srpr_main.id
}

output "node_group_arn" {
  description = "The ARN of the EKS node group"
  value       = aws_eks_node_group.srpr_main.arn
}