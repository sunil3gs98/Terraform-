
variable "amiid" {
    type=string
    default = "ami-068c00xxxxxx"
  
}

variable "subnetid" {
  type = string
  default = "subnet-03f5xxxxx"
}

variable "instancetype" {
  type = string
  default = "t3.micro"
}
