# configure aws provider
provider "aws" {
  region = var.region
  profile = "default"
}

# create vpc 
module "vpc" {
  source = "../modules/vpc"
  region          =  var.region
  project_name    = var.project_name 
  vpc_cidr        =  var.vpc_cidr
  pb_sn_az1_cidr  =  var.pb_sn_az1_cidr
  pb_sn_az2_cidr  =  var.pb_sn_az2_cidr
  pb_sn_az3_cidr  =  var.pb_sn_az3_cidr
  pvt_sn_az1_cidr =  var.pvt_sn_az1_cidr
  pvt_sn_az2_cidr =  var.pvt_sn_az2_cidr
  pvt_sn_az3_cidr =  var.pvt_sn_az3_cidr
  pvt_db_az1_cidr =  var.pvt_db_az1_cidr
  pvt_db_az2_cidr =  var.pvt_db_az2_cidr
  pvt_db_az3_cidr =  var.pvt_db_az3_cidr
}