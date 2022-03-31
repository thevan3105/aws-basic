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
  # subnet_public_id = module.network-layer.lms_subnet_public_id
}

#-----------EC2-INSTANCE MODULE---------------
module "ec2-instance" {
  source            = "./modules/ec2-instance"
  env               = var.env
  project           = var.project
  region            = var.region
  vpc_cidr          = var.vpc_cidr
  private_cidrs     = var.private_cidrs
  subnet_public_id  = module.vpc-network.lab_subnet_public_id
  sg_alb_id         = module.vpc-network.lab_sg_web_alb_id
  vpc_id            = module.vpc-network.lab_vpc_id
  public_cidrs      = var.public_cidrs
  sg_ec2_id         = module.vpc-network.lab_sg_web_ec2_id
}