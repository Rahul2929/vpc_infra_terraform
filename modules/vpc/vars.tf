variable "vpc_cidr" {}

variable "vpc_tag" {}

variable "subnet_tag" {
  type = "list"
  default = ["public_sub", "private_sub"]
}

variable "availability_zone" {}

variable "subnet_cidrs" {}
