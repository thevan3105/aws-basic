#All variable are define at terraform.tfvars
variable "project" {
  default     = "lab"
}
variable "env" {
#   description = <<DESCRIPTION
# Type Environment: test | stg | stg | clone | prod
# DESCRIPTION
  default     = "stg"
}
variable "profile" {
  default = "~/.aws/config"
}

#---------------NETWORK-LAYER MODULE----------
variable "region" {
    default = "us-east-1"
}
variable "vpc_cidr" {
    default = "10.0.0.0/16"
}
variable "private_cidrs" {
    default = "10.0.32.0/20"
}
variable "public_cidrs" {
    default = "10.0.0.0/20"
}