resource "aws_security_group" "lms_sg_batch_instance" {
  name        = "${var.project}-sg-ec2-batch-${var.env}"
  vpc_id      = var.vpc_id
  description = "Allow all out-traffic/Limit http, https, ssh in-traffic"

  ingress {
    from_port       = 22
    to_port         = 22
    description     = "allow bastion"
    protocol        = "tcp"
    security_groups = [var.lms_sg_bastion_instance_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.project}-sg-ec2-batch-${var.env}"
    Type  = "batch"
    Stage = var.env
  }
}
