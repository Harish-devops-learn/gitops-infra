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