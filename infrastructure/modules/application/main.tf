data "aws_availability_zones" "all" {
}

resource "aws_ecs_cluster" "application_cluster" {
  name = vars.environment_name
}