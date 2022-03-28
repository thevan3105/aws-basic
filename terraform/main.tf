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