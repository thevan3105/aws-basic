#modules/auto-scale-layer/variables.tf
variable "project" {}
variable "env" {}
variable "region" {}
variable "vpc_id" {}
variable "sun_hni_ips" {}
variable "sun_dng_ips" {}
variable "lms_subnet_private_id" {}
variable "lms_sg_bastion_instance_id" {}
#2. batch
variable "batch_instance_type" {}
variable "batch_volume_size" {}
variable "lms_s3_secret_bucket_arn" {}
variable "lms_s3_codedeploy_bucket_arn" {}