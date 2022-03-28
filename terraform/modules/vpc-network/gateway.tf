# #create gateway
# resource "aws_eip" "lab_nat_gateway_eip" {
#   vpc = true

#   tags = {
#     name = "${var.project}-eip-nat-gateway-${var.env}"
#   }
# }

# resource "aws_nat_gateway" "lab_nat_gateway" {
#   allocation_id = aws_eip.lab_nat_gateway_eip.id
#   subnet_id = aws_subnet.subnet_public.*.id[0]#

#   tags = {
#     name = "${var.project}-nat-gateway-${var.env}"
#   }
# }

#1. INTERNET GATEWAY for public subnet
resource "aws_internet_gateway" "lab_internet_gateway" {
  vpc_id = aws_vpc.lab_vpc.id

  tags = {
    name = "${var.project}-internet-gateway-${var.env}"
  }
}