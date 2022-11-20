data "google_client_config" "current" {
}

data "google_container_cluster" "portfolio-cluster" {
    name     = var.cluster_name
    location = var.zone
    project  = var.project
    depends_on = [
        module.compute.cluster
    ]
}