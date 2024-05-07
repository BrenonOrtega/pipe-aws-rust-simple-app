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
  region = vars.region
  environment_name = vars.environment_name
  environment_type = vars.environment_type
}

module "vpc" {
  source = "./modules/vpc"
  region = vars.region
  environment_name = vars.environment_name
  environment_type = vars.environment_type
}

module "registry" {
  source = "./modules/registry"
  region = vars.region
  environment_name = vars.environment_name
  environment_type = vars.environment_type
}