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
  region = var.region
  environment_name = var.environment_name
  environment_type = var.environment_type
}

module "vpc" {
  source = "./modules/vpc"
  region = var.region
  environment_name = var.environment_name
  environment_type = var.environment_type
}

module "registry" {
  source = "./modules/registry"
  region = var.region
  environment_name = var.environment_name
  environment_type = var.environment_type
}