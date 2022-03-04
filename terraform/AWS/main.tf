# Define required providers
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.32.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.provider_region

}

module "webserver" {
  source = "../../../../tfc-guide-example/modules/aws-s4-server"
  provider_region = var.provider_region
  instance_name = var.instance_name
  ami_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
}
