terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "web_app_1" {
  source = "../web-app-module"

  public_key = var.public_key
  web_app_sg_vpc_id  = var.web_app_sg_vpc_id
}
