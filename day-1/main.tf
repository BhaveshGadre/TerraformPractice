resource "aws_instance" "name" {
    region = "us-east-1"
    instance_type = var.instype
    ami = var.ami_id

  
}