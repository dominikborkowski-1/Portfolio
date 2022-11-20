provider "google" {
    project = var.project
    region = var.region
}


terraform {
    backend "gcs" {
        bucket = "portfolio-tf-state"
        prefix = "terraform/state"
    }
}


provider "helm" {
    kubernetes {
    token                  = data.google_client_config.current.access_token
    host                   = "https://${module.compute.cluster_endpoint}"
    cluster_ca_certificate = base64decode(module.compute.cluster_certificate)
    }
}

provider "kubernetes" {
    host                   = "https://${module.compute.cluster_endpoint}"
    cluster_ca_certificate = base64decode(module.compute.cluster_certificate)
    token                  = data.google_client_config.current.access_token
}

module "network" {
    source = "./modules/network/"
    project = var.project
    region = var.region
    vpc_name = var.vpc_name
    subnet_name = var.subnet_name
    subnet_cidr_range = var.subnet_cidr_range
    kubernetes_pod_range_cidr = var.kubernetes_pod_range_cidr
    kubernetes_service_range_cidr = var.kubernetes_service_range_cidr
    router_name = var.router_name
    nat_name = var.nat_name
    firewall_name = var.firewall_name
    firewall_protocol = var.firewall_protocol
    firewall_ports = var.firewall_ports
    firewall_source_ranges = var.firewall_source_ranges
}

module "compute" {
    source = "./modules/compute/"

    cluster_name = var.cluster_name
    zone = var.zone
    node_pool_name = var.node_pool_name
    node_number = var.node_number
    instance_type = var.instance_type
    vpc_self_link = module.network.vpc_self_link
    subnet_self_link = module.network.subnet_self_link

    depends_on = [module.network]
}

module "ingress-nginx" {
    source = "./modules/ingress-nginx/"
}

module "certmanager" {
    source = "./modules/cert-manager/"
}