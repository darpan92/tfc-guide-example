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
  for_each = "${{for r in local.resource_data.resources : try(r.app_instance_name, "") => r if try(r.app_instance_name, "") != ""}}" 
  ami = each.value.ami
  instance_type = try(each.value.app_instance_type, "")
  tags = {
    Name = try(each.value.app_instance_name, "")
  }
}

resource "aws_instance" "db" {
  for_each = "${{for r in local.resource_data.resources : try(r.db_instance_name, "") => r if try(r.db_instance_name, "") != ""}}"
  ami = each.value.ami
  instance_type = try(each.value.db_instance_type, "")
  tags = {
    Name = try(each.value.db_instance_name, "")
  }
} 
