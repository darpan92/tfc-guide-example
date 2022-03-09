terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.4.0"
    }
  }
}

resource "aws_instance" "web" { 
  count = 3
  ami = "ami-0c293f3f676ec4f90"
  instance_type = "t2.micro"
}

