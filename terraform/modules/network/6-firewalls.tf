resource "google_compute_firewall" "allow-ssh-http-https" {
    name = var.firewall_name
    network = google_compute_network.portfolio-kubernetes-vpc.name

    allow {
        protocol = var.firewall_protocol
        ports = var.firewall_ports
    }

    source_ranges = var.firewall_source_ranges
}