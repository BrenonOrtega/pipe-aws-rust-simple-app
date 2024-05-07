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
