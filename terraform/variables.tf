variable "cluster_name" {
  description = "Name of the EKS cluster"
  default     = "gitops-eks"
  type        = string
}

variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
  type        = string
}

variable "admin_users" {
  description = "IAM users with cluster-admin access"
  type = list(string)
  default = [
    "arn:aws:iam::612081458898:user/harish"
  ]
}

variable "developer_users" {
  description = "IAM users with edit access"
  type = list(string)
  default = []
}

variable "argocd_password_plain" {
  description = "ArgoCD admin password"
  type        = string
  sensitive   = true
}