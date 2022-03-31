#modules/network-layer/variables.tf
output "lab_vpc_id" {
  value = aws_vpc.lab_vpc.id
}

output "lab_subnet_public_id" {
  value = aws_subnet.lab_subnet_public.*.id
}

output "lab_internet_gateway_id" {
  value = aws_internet_gateway.lab_internet_gateway.id
}

output "lab_sg_web_alb_id" {
  value = aws_security_group.lab_sg_web_alb.id
}

output "lab_sg_web_ec2_id" {
  value = aws_security_group.lab_sg_web_instance.id
}
