provider "aws" {
    region = "us-east-1"    
  
}
resource "aws_security_group_rule" "http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "sg-03fd4d0b1ef616bb4"
}

resource "aws_instance" "Provisioners_Test" {
    ami = "ami-0ecb62995f68bb549"
    subnet_id = "subnet-03f58cc8a831d0f3b"
    instance_type = "t2.micro"
    associate_public_ip_address = true 
    vpc_security_group_ids = ["sg-03fd4d0b1ef616bb4"]
    key_name               = "Linus"
    tags = {
      name="Provisioners"
    }

    connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/Users/sunil3gs98/.ssh/Linus.pem")
    host        = self.public_ip
  }

    provisioner "file" {
      source = "app.py"
      destination = "/home/ubuntu/app.py"
    }
   provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y python3-pip",
      "sudo pip3 install flask",
      "sudo python3 /home/ubuntu/app.py &"
    ]
  }
  
}

