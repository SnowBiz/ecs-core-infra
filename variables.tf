################################################################################
# Variables
################################################################################

variable "region" {
    description = "Region to provision resources in"
}

variable "vpc_id" {
    description = "VPC to use for core-infra"  
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
}

variable "cluster_name" {
    description = "Name for ECS Cluster"
}