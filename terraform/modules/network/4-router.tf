resource "google_compute_router" "portfolio-router" {
    name = var.router_name
    region = var.region
    network = google_compute_network.portfolio-kubernetes-vpc.id
}