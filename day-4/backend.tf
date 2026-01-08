terraform {
  backend "s3" {
    bucket = "bhaveshkibucket123"
    key = "terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
    
  }
}