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

provider "aws" {
  # Configuration options
  region = local.resource_data.provider_region
}

module "s4-server" {
  for_each = "${{for r in local.resource_data.resources : r.instance_name => r}}"
  source = "github.com/darpan92/tfc-guide-example/modules"
  provider_region = local.resource_data.provider_region
  instance_name = each.value.instance_name
  ami = each.value.ami
  instance_type = each.value.instance_type
}
