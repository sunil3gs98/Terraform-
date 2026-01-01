
variable "amiid" {
    type=string
    default = "ami-068c00ddddddd"
  
}

variable "subnetid" {
  type = string
  default = "subnet-03f58cccccccccc"
}

variable "instancetype" {
  type = string
  default = "t3.micro"
}
