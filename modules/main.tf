terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.4.0"
    }
  }
}

resource "aws_instance" "web" { 
  ami = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
}

