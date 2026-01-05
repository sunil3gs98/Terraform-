resource "aws_vpc" "Test" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Provisioners_VPC"
  }
}

resource "aws_subnet" "Test1" {
  vpc_id                  = aws_vpc.Test.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a" 
  map_public_ip_on_launch = true

  tags = {
    Name = "Provisioners_subnet"
  }
}

resource "aws_internet_gateway" "Pgateway" {
  vpc_id = aws_vpc.Test.id
  tags = {
    Name = "Provisioners_gate"
  }
}

resource "aws_route_table" "Proute_table" {
  vpc_id = aws_vpc.Test.id 
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Pgateway.id
  }
}

resource "aws_route_table_association" "Passociation" {
  subnet_id      = aws_subnet.Test1.id
  route_table_id = aws_route_table.Proute_table.id 
}

resource "aws_security_group" "Psecurity" {
  vpc_id = aws_vpc.Test.id 

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22 
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0 
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  tags = { # Fixed: added = and { }
    Name = "Provisioner_SG"
  }
}


resource "aws_instance" "server" {
  ami                    = "ami-0261755bbcb8c4a84"
  instance_type          = "t2.micro"
  key_name      = aws_key_pair.example.key_name
  vpc_security_group_ids = [aws_security_group.Psecurity.id]
  subnet_id              = aws_subnet.Test1.id
}
