variable "name" {
  description = "vpc name for an instance of the platform"
}

variable "cidr_reservation_start" {
  description = "Second octet for IANA private class A network reservation"
}

variable "azs" {
  description = "The list of Availability zones in the region to span"
  default     = []
}

variable "public_subnet_size" {
  description = "network size"
  default = "20"
}
variable "public_subnet_start" {
  description = "starting number for three, sequential public subnets"
  default = ["0","16","32"]
}

variable "nat_subnet_size" {
  description = "network size"
  default = "22"
}
variable "nat_subnet_start" {
  description = "starting number for three, sequential public subnets"
  default = ["48","52","56"]
}
variable "internal_subnet_size" {
  description = "network size"
  default = "20"
}
variable "internal_subnet_start" {
  description = "starting number for three, sequential public subnets"
  default = ["64","80","96"]
}

variable "enable_dns_hostnames" {
  description = "should be true to use private DNS within the VPC"
  default     = "false"
}

variable "enable_dns_support" {
  description = "should be true to use private DNS within the VPC"
  default     = "false"
}

variable "map_public_ip_on_launch" {
  description = "should be true if you do want to auto-assign public IP on launch"
  default     = "false"
}

variable "public_propagating_vgws" {
  description = "A list of VGWs the public route table should propagate."
  default     = []
}

variable "enable_nat_gateway" {
  description = "should be true to provision NAT Gateways for each private network"
  default     = "false"
}

variable "private_propagating_vgws" {
  description = "A list of VGWs the private route table should propagate."
  default     = []
}

variable "k8_cluster_name" {
  description = "The name of the intendend K8 Cluster - will be used with Kops"
  default = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}