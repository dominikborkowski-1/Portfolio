output "cluster_endpoint" {
    value = google_container_cluster.portfolio-cluster.endpoint
}

output "cluster_certificate" {
    value = google_container_cluster.portfolio-cluster.master_auth[0].cluster_ca_certificate
}

output "cluster" {
    value = google_container_cluster.portfolio-cluster
}