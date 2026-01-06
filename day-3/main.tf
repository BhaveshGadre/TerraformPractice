resource "aws_instance" "EC2" {
    region = "us-east-1"
    instance_type = var.instype
    ami = var.ami_id
    tags = {
        Name = "tf1ec2"
    }
  
}