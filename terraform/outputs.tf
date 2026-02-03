output "cluster_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "Endpoint for EKS control plane"
}

output "cluster_name" {
  value       = module.eks.cluster_name
  description = "Kubernetes Cluster Name"
}

output "cluster_certificate_authority_data" {
  value       = module.eks.cluster_certificate_authority_data
  description = "CA for kubeconfig"
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "VPC for cluster"
}