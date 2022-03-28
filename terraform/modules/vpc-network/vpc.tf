# create vpc for PJ
resource "aws_vpc" "lab_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = false ## default setting

  tags = {
    "name" = "${var.project}-vpc-${var.env}"
  }
}

##Data sources allow Terraform to use information defined outside of Terraform, defined by another separate Terraform configuration, or modified by functions.
data "aws_availability_zones" "aws_availability" {

}