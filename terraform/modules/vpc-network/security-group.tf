#3. SG for web 
#3.1 web ELB
resource "aws_security_group" "lab_sg_web_alb" {
  name        = "${var.project}-sg-alb-web-${var.env}"
  vpc_id      = aws_vpc.lab_vpc.id
  description = "Allow all out-traffic/all http, https in-traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    description = "allow 80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 443
    to_port     = 443
    description = "allow 443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.project}-sg-alb-web-${var.env}"
    Type  = "web"
    Stage = var.env
  }
}

# data "aws_security_group" "lab_sg_web_alb" {
#   id = var.subnet_id
# }

#3.2 web Instance
resource "aws_security_group" "lab_sg_web_instance" {
  name        = "${var.project}-sg-ec2-web-${var.env}"
  vpc_id      = aws_vpc.lab_vpc.id
  description = "Allow all out-traffic/Limit http, https, ssh in-traffic"

  ingress {
    from_port       = 22
    to_port         = 22
    description     = "allow bastion"
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    description     = "allow alb web"
    protocol        = "tcp"
    security_groups = [aws_security_group.lab_sg_web_alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.project}-sg-ec2-web-${var.env}"
    Type  = "web"
    Stage = var.env
  }
}
