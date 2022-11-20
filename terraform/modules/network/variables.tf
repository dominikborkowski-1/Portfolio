variable "project" {
    type = string
}

variable "region" {
    type = string
}

variable "vpc_name" {
    type = string
}

variable "subnet_name" {
    type = string
}

variable "subnet_cidr_range" {
    type = string
}

variable "kubernetes_pod_range_cidr" {
    type = string
}

variable "kubernetes_service_range_cidr" {
    type = string
}

variable "router_name" {
    type = string
}

variable "nat_name" {
    type = string
}

variable "firewall_name" {
    type = string
}

variable "firewall_protocol" {
    type = string
}

variable "firewall_ports" {
    type = list
}

variable "firewall_source_ranges" {
    type = list
}