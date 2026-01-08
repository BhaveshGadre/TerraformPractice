resource "aws_instance" "EC2" {
    region = "us-east-1"
    ami = var.ami_id
    instance_type = var.instype
    tags = {
      Name = "Remote Statefile"
    }
  
}