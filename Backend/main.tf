provider "aws" {
    region = "us-east-1"    
  
}

resource "aws_instance" "BackedTest" {
    ami = "ami-0ecb62995xxxxxx"
    subnet_id = "subnet-03f58cc8xxxxxx"
    instance_type = "t2.micro"
  
}
