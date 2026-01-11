resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name ="cust-vpc"
    }
  
}

resource "aws_subnet" "sub-pub" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.name.id
    tags = {
      Name = "sub-pub"
    }
  
}


resource "aws_subnet" "sub-pvt" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.name.id
    tags = {
      Name = "sub-pvt"
    }
  
}

resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id
    tags = {
      Name = "cust-IG"
    }
  
}

resource "aws_route_table" "name" {
    vpc_id = aws_vpc.name.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id =aws_internet_gateway.name.id
    }
  
}

resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.sub-pub.id
    route_table_id = aws_route_table.name.id
  
}

resource "aws_security_group" "sg" {
    name = "mainsg"
    vpc_id = aws_vpc.name.id

    ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}

resource "aws_instance" "name" {
    ami = "ami-068c0051b15cdb816"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.sub-pub.id
    vpc_security_group_ids =[aws_security_group.sg.id]

  
}