resource "google_container_cluster" "portfolio-cluster" {
    name = var.cluster_name
    location = var.zone
    remove_default_node_pool = true
    initial_node_count = 1
    network = var.vpc_self_link
    subnetwork = var.subnet_self_link
    networking_mode = "VPC_NATIVE"

    addons_config {
        http_load_balancing {
            disabled = true
        }
        horizontal_pod_autoscaling {
            disabled = false
        }
    }

    release_channel {
        channel = "REGULAR"
    }

    workload_identity_config {
        workload_pool = "atomic-router-366510.svc.id.goog"
    }

    ip_allocation_policy {
        cluster_secondary_range_name = "k8s-pod-range"
        services_secondary_range_name = "k8s-service-range"
    }

    private_cluster_config {
        enable_private_nodes = true
        enable_private_endpoint = false
        master_ipv4_cidr_block = "172.16.0.0/28"
    }
}