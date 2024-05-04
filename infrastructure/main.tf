terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
}

module "application" {
    source = "./modules/application"
}

module "vpc" {
    source = "./modules/vpc"
}

module "registry" {
  source = "./registry"
}