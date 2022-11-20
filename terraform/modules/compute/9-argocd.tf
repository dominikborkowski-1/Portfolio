resource "helm_release" "argocd" {
    name  = "argocd"

    repository       = "https://argoproj.github.io/argo-helm"
    chart            = "argo-cd"
    namespace        = "default"
    version          = "5.13.8"
    #create_namespace = true

    # values = [
    #     file("argocd/application.yaml")
    # ]
}