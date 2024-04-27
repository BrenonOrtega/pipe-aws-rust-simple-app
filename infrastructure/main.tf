terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-south-2"
  profile = "real-billable-aws"
  shared_config_files      = ["C:\\Users\\Bryan\\.aws\\config"]
  shared_credentials_files = ["C:\\Users\\Bryan\\.aws\\credentials"]
}



module "application" {
    source = "./modules/application"
}