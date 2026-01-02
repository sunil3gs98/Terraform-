terraform {
  backend "s3" {
    bucket = "test97sunil"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}