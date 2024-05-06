variable "environment_type" {
  type = string
  description = "The environment where this terraform file will be applied to."
}

variable "environment_name" {
  type = string
  description = "The full name of the environment to be applied."
}


variable "region" {
  type = string
  description = "The region of the deployment"
}

variable "workspace_profiles" {
  default = {
    development    = "real-billable-aws"
    # roles example:
    # production = "arn:aws:iam::PRODUCTION-ACCOUNT-ID:role/Terraform"
  }
}

variable "instance_type" {
  type = string
  description = "Size of ecs container instance."
  default = "t3.nano"
}

variable "registry_url" {
  type = string
  description = "Url of the registry for pushing container images."
}
