resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "${var.vpc_tag}"
  }
}

resource "aws_subnet" "main" {
  count = "${length(var.subnet_cidrs)}"
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${element(var.subnet_cidrs, count.index)}"
  availability_zone = "${var.availability_zone}"
  tags = {
    Name = "${element(var.subnet_tag, count.index)}"
  }
}
