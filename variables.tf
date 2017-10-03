variable "name" {
  description = "vpc name for an instance of the platform"
}

variable "cidr" {
  description = "cidr reservation for environment"
}

variable "enable_dns_hostnames" {
  description = "should be true to use private DNS within the VPC"
  default     = false
}

variable "enable_dns_support" {
  description = "should be true to use private DNS within the VPC"
  default     = false
}

variable "azs" {
  description = "The list of Availability zones in the region to span"
  default     = []
}

variable "public_subnets" {
  description = "The list of the public subnets for the cluster"
  default     = []
}

variable "map_public_ip_on_launch" {
  description = "should be true if you do want to auto-assign public IP on launch"
  default     = false
}

variable "public_propagating_vgws" {
  description = "A list of VGWs the public route table should propagate."
  default     = []
}

variable "nat_subnets" {
  description = "The list of nated private subnets for the cluster"
  default     = []
}

variable "enable_nat_gateway" {
  description = "should be true to provision NAT Gateways for each private network"
  default     = false
}

variable "internal_subnets" {
  description = "The list of non-nated privated subnets for the cluster"
  default     = []
}

variable "private_propagating_vgws" {
  description = "A list of VGWs the private route table should propagate."
  default     = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}