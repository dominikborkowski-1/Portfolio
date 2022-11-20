resource "google_compute_subnetwork" "private-kubernetes-subnet" {
    name = var.subnet_name
    ip_cidr_range = var.subnet_cidr_range
    region = var.region
    network = google_compute_network.portfolio-kubernetes-vpc.id
    private_ip_google_access = true

    secondary_ip_range {
        range_name = "k8s-pod-range"
        ip_cidr_range = var.kubernetes_pod_range_cidr
    }

    secondary_ip_range {
        range_name = "k8s-service-range"
        ip_cidr_range = var.kubernetes_service_range_cidr
    }

}