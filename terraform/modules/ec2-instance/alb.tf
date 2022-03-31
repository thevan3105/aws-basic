# ALB for web
resource "aws_lb" "lab_alb_web" {
  name               = "${var.project}-alb-web-${var.env}"
  load_balancer_type = "application"
  security_groups    = [var.sg_alb_id]
  subnets            = var.subnet_public_id
  internal           = false

  idle_timeout = 60

  tags = {
    Name  = "${var.project}-alb-web-${var.env}"
    Type  = "web"
    Stage = var.env
  }
}

resource "aws_lb_listener" "lab_alb_web_listener" {
  load_balancer_arn = aws_lb.lab_alb_web.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lab_alb_web_target_grp.arn
    # redirect {
    #   port        = "443"
    #   protocol    = "HTTPS"
    #   status_code = "HTTP_301"
    # }
  }
}

# resource "aws_lb_listener" "lab_alb_web_listener_ssl" {
#   load_balancer_arn = aws_lb.lab_alb_web.arn
#   port              = "443"
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-FS-1-2-Res-2020-10"
# #   certificate_arn   = var.lms_cert_arn

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.lab_alb_web_target_grp.arn
#   }
# }

resource "aws_lb_target_group" "lab_alb_web_target_grp" {
  name     = "${var.project}-alb-web-tgp-${var.env}"
  port     = 80
  protocol = "HTTP"

  vpc_id = var.vpc_id

  target_type = "instance"
  health_check {
    path = "/"
    port = 80
  }
  deregistration_delay = 300

  tags = {
    Name  = "${var.project}-alb-web-tgp-${var.env}"
    Type  = "web"
    Stage = var.env
  }
}

// Attach the target groups to the instance(s)
resource "aws_lb_target_group_attachment" "lab_attach_tg_ec2" {
  target_group_arn  = aws_lb_target_group.lab_alb_web_target_grp.arn
  target_id         = aws_instance.ec2_instance.id
  port              = 80
}