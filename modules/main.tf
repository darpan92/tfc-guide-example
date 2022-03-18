terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.4.0"
    }
  }
}

locals {
  resource_data = jsondecode(file("../resources/resources.json"))
}

resource "aws_instance" "app" { 
  for_each = "${{for r in local.resource_data.resources : r.app_instance_name => r}}" 
  ami = each.value.ami
  instance_type = each.value.app_instance_type
  tags = {
    Name = each.value.app_instance_name
  }
}

resource "aws_instance" "db" {
  for_each = "${{for r in local.resource_data.resources : r.db_instance_name => r}}"
  ami = each.value.ami
  instance_type = each.value.db_instance_type
  tags = {
    Name = each.value.db_instance_name
  }
} 
