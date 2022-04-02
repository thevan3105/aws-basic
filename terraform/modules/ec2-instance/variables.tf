#modules/ec2-instance/variables.tf
#basic
variable "env" {}
variable "project" {}
variable "region" {}
variable "private_cidrs" {}
variable "public_cidrs" {}
variable "vpc_cidr" {}

#alb
variable "subnet_public_id" {}
variable "sg_alb_id" {}
variable "vpc_id" {}

#ec2-instance
variable "ami_id" { default = "ami-055d15d9cfddf7bd3" } #ubuntu20.04HVM
variable "instance_type" { default = "t2.micro" }
variable "iam_instance_profile" { default = null }
variable "volume_size" { default = 8}
variable "user_data" { default = null }
variable "monitoring" { default = false }
variable "sg_ec2_id" {}
// add user_data
variable "user_name" {
  description = "The user creating this infrastructure"
  default     = "terraform"
}

variable "user_department" {
  description = "The organization the user belongs to: dev, prod, qa"
  default     = "learn"
}