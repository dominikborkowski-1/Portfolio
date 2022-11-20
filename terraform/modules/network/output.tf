output "vpc_self_link" {
    value = "${google_compute_network.portfolio-kubernetes-vpc.self_link}"
}

output "subnet_self_link" {
    value = "${google_compute_subnetwork.private-kubernetes-subnet.self_link}"
}