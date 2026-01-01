
variable "amiid" {
    type=string
    default = "ami-068c0051b15cdb816"
  
}

variable "subnetid" {
  type = string
  default = "subnet-03f58cc8a831d0f3b"
}

variable "instancetype" {
  type = string
  default = "t3.micro"
}