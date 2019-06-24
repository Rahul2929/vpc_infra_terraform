variable "vpc_cidr" {
  default = "192.168.0.0/24"
}

variable "vpc_tag" {}

variable "subnet_tag" {
  type = "list"
  default = ["public_sub", "private_sub"]
}

variable "subnet_cidrs" {
  type = "list"
  default = ["192.168.0.0/25", "192.168.0.128/25"]
}

variable "availability_zone" {}
