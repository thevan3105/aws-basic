# Need to create key-pair on AWS Console
resource "aws_instance" "ec2_instance" {
  ami                           = var.ami_id
  key_name                      = "lab-architect-key-van"
  subnet_id                     = var.subnet_public_id[0]
  vpc_security_group_ids        = [var.sg_ec2_id]
  iam_instance_profile          = var.iam_instance_profile
  instance_type                 = var.instance_type
  associate_public_ip_address   = true

  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.volume_size
    delete_on_termination = true
  }
  credit_specification {
    cpu_credits = "standard"
  }

  disable_api_termination = false
  user_data               = templatefile("modules/ec2-instance/user_data.tftpl", { department = var.user_department, name = var.user_name })
  monitoring              = var.monitoring

  tags = {
    Name = "${var.project}-ec2-instance-${var.env}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
