resource "aws_network_acl" "lab_acl_public" {
  vpc_id     = "${aws_vpc.lab_vpc.id}"
  subnet_ids = "${aws_subnet.lab_subnet_public.*.id}"

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${var.project}-acl-public-${var.env}"
  }
}