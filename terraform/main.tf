# terraform

provider "aws" {
  alias = "singapore"
  region = "ap-southeast-1"
  profile = var.profile
}

#-----------NETWORK-LAYER MODULE-------------
module "vpc-network" {
  source        = "./modules/vpc-network"
  env           = var.env
  project       = var.project
  region        = var.region
  vpc_cidr      = var.vpc_cidr
  private_cidrs = var.private_cidrs
  public_cidrs  = var.public_cidrs
}

#-----------SECURITY-GROUP MODULE---------------
module "bastion-layer" {
  source                = "./modules/security-group"
  env                   = var.env
  full_env              = var.full_env
  project               = var.project
  region                = var.region
  vpc_id                = module.network-layer.lms_vpc_id
  sun_hni_ips           = var.sun_hni_ips
  sun_dng_ips           = var.sun_dng_ips
  subnet_public_id      = module.network-layer.lms_subnet_public_id
  bastion_instance_type = var.bastion_instance_type
  bastion_volume_size   = var.bastion_volume_size
}