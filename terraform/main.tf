terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.4.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.provider_region
}

module "s4-server" {
  source = "github.com/darpan92/tfc-guide-example/modules"
  instance_name = var.instance_name
  instance_type = var.instance_type
}
