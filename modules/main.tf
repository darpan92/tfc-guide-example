terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.4.0"
    }
  }
}

resource "aws_instance" "web" { 
  ami = "ami-0e1d30f2c40c4c701"
  instance_type = "t2.micro"
}

