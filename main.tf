provider "aws" {
    region = "us-east-1"    
  
}

module "test" {
  source = "./module"
  subnetid = var.subnetid
  instancetype = var.instancetype
  amiid = var.amiid
}