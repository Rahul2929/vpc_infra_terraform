variable "ami_id" {
        default = "ami-0eacc5b7915ba9921"
}

variable "ami_tag" {
  type = "list"
  default = ["frontend", "backend"]
}

variable "subnet_id" {}

variable "availability_zone" {}
 
variable "securitygroup" {
  type = "list"
}
