output "subnet_id" {
        value = ["${aws_subnet.main.*.id}"]
}

output "vpc_id" {
        value = "${aws_vpc.main.id}"
}

output "subnets" {
        value = "${var.subnet_cidrs}"
}

