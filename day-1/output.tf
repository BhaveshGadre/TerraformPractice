output "pvtip" {
    value = aws_instance.name.private_ip
  
}

output "pubip" {
    value = aws_instance.name.public_ip
  
}