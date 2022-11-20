# resource "google_service_account" "kubernetes" {
#     account_id = "kubernetes"
# }

resource "google_container_node_pool" "general" {
    name = var.node_pool_name
    cluster = google_container_cluster.portfolio-cluster.id
    node_count = var.node_number

    management {
        auto_repair = true
        auto_upgrade = true
    }

    node_config {
        preemptible = false
        machine_type = var.instance_type

        labels = {
            role = "general"
        }
        # service_account = google_service_account.kubernetes.email
        oauth_scopes = [
            "https://www.googleapis.com/auth/cloud-platform"
        ]
    }
}
