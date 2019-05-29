resource "aws_instance" "web" {
  count = "${length(var.subnet_id)}"
  ami = "${var.ami_id}"
  instance_type = "t2.micro"
  subnet_id = "${element(var.subnet_id, count.index)}"
  availability_zone = "${var.availability_zone}"
  associate_public_ip_address = "${element(var.ami_tag, count.index) == "frontend" ? true : false}"
  vpc_security_group_ids = ["${element(var.securitygroup, count.index)}"]
  tags = {
    Name = "${element(var.ami_tag, count.index)}"
  }
}
