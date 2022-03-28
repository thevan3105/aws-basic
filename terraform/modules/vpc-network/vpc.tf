# create vpc for PJ
resource "aws_vpc" "lab_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = false ## default setting

  tags = {
    "name" = "${var.project}-vpc-${var.env}"
  }
}