# Production EKS Access Management
resource "aws_eks_access_entry" "admins" {
  for_each = toset(var.admin_users)
  
  cluster_name  = var.cluster_name
  principal_arn = each.value
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "admin_access" {
  for_each = toset(var.admin_users)
  
  cluster_name  = var.cluster_name
  principal_arn = each.value
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  
  access_scope {
    type = "cluster"
  }
  
  depends_on = [aws_eks_access_entry.admins]
}

resource "aws_eks_access_entry" "developers" {
  for_each = toset(var.developer_users)
  
  cluster_name  = var.cluster_name
  principal_arn = each.value
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "developer_access" {
  for_each = toset(var.developer_users)
  
  cluster_name  = var.cluster_name
  principal_arn = each.value
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSEditPolicy"
  
  access_scope {
    type = "cluster"
  }
  
  depends_on = [aws_eks_access_entry.developers]
}