terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.4.0"
    }
  }
  #cloud {
  #  organization = "DarpanTest"
  #  workspaces {
  #    name = "Terraform-Test"
  #  }
  #}
}

locals {
  resource_data = jsondecode(file("../resources/resources.json"))
}

provider "aws" {
  # Configuration options
  region = local.resource_data.provider_region
}

module "s4-server" {
  #for_each = "${{for r in local.resource_data.resources : r.app_instance_name => r}}"
  source = "github.com/darpan92/tfc-guide-example/modules"
  provider_region = local.resource_data.provider_region
  app_instance_name = var.app_instance_name
  ami = var.ami
  app_instance_type = var.app_instance_type
  db_instance_name = var.db_instance_name
  db_instance_type = var.db_instance_type
}
