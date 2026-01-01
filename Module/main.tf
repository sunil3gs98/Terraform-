provider "aws" {
    region = "us-east-1"    
  
}

resource "aws_instance" "ModuleTest1" {
    ami = var.amiid
    subnet_id = var.subnetid
    instance_type = var.instancetype
  
}
