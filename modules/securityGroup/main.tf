resource "aws_security_group" "sgweb" {
  name = "webSG"
  description = "Allow incoming HTTP connections & SSH access"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }

  vpc_id = "${var.vpc_id}"

  tags = {
    Name = "frontend_SG"
  }
}

resource "aws_security_group" "sgdb"{
  name = "dbSG"
  description = "Allow traffic from public subnet"

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["${element(var.public_subnet_cidr, 1)}"]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["${element(var.public_subnet_cidr, 1)}"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${element(var.public_subnet_cidr, 1)}"]
  }

  vpc_id = "${var.vpc_id}"

  tags = {
    Name = "backend_SG"
  }
}

output "sgdb" {
	value = "${aws_security_group.sgdb.id}"
}

output "sgweb" {
	value = "${aws_security_group.sgweb.id}"
}
