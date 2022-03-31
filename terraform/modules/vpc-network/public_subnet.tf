#create public subnet
resource "aws_subnet" "lab_subnet_public" {
  count             = length(var.public_cidrs)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_id            = aws_vpc.lab_vpc.id
  cidr_block        = var.public_cidrs[count.index]

  tags = {
    Name = "${var.project}-subnet-public-${var.env}"
  }
}
resource "aws_route_table" "lab_route_public" {
  vpc_id = aws_vpc.lab_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab_internet_gateway.id
  }
  
  tags = {
    Name = "${var.project}-route-public-${var.env}"
  }
}

resource "aws_route_table_association" "public" {
  count = length(aws_subnet.lab_subnet_public)
  subnet_id = aws_subnet.lab_subnet_public.*.id[count.index]
  route_table_id = aws_route_table.lab_route_public.id
}