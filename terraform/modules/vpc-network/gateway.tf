#1. INTERNET GATEWAY for public subnet
resource "aws_internet_gateway" "lab_internet_gateway" {
  vpc_id = aws_vpc.lab_vpc.id

  tags = {
    name = "${var.project}-internet-gateway-${var.env}"
  }
}