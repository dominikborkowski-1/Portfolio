resource "google_compute_router_nat" "portfolio-nat" {
    name = var.nat_name
    router = google_compute_router.portfolio-router.name
    region = var.region

    source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
    nat_ip_allocate_option = "MANUAL_ONLY"

    subnetwork {
        name = google_compute_subnetwork.private-kubernetes-subnet.id
        source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
    }

    nat_ips = [google_compute_address.portfolio-nat.self_link]
}

resource "google_compute_address" "portfolio-nat" {
    name = var.nat_name
    address_type = "EXTERNAL"
    network_tier = "PREMIUM"

    depends_on = [google_project_service.compute]
}