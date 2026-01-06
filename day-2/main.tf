resource "aws_instance" "EC2day2" {
    region = "us-east-1"
    ami = var.ami_id
    instance_type = var.instype
    tags = {
      Name = "Day2"
    }
  
}

resource "aws_instance" "test" {
    region = "us-east-1"
    ami = var.ami_id
    instance_type = var.instype
    tags = {
      Name = "test"
    }
  
}