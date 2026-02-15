resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "argocd"
  create_namespace = true

  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = bcrypt(var.argocd_password_plain)  # Converts "K7mP9xQ2" → "$2a$10$..."
  }

  # Expose via LoadBalancer
  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  depends_on = [module.eks]
}