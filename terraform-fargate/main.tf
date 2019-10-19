/*====
Variables used across all modules
======*/
locals {
  production_availability_zones = ["ap-southeast-2a", "ap-southeast-2b"]
}

# Specify the provider and access details
provider "aws" {
  region = "ap-southeast-2"
  profile = "terraform"
}

module "networking" {
  source               = "./modules/networking"
  environment          = "production"
  vpc_cidr             = "10.0.0.0/16"
  public_subnets_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets_cidr = ["10.0.10.0/24", "10.0.20.0/24"]
  region               = "${var.region}"
  availability_zones   = "${local.production_availability_zones}"
  key_name             = "production_key"
}

module "ecs" {
  source              = "./modules/ecs"
  environment         = "production"
  repository_name     = "aspnetcorefargate/production"
}