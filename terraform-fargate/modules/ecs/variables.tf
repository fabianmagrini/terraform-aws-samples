variable "environment" {
  description = "The environment"
}

variable "repository_name" {
  description = "The name of the repisitory"
}

/*====
ECS cluster
======*/
resource "aws_ecs_cluster" "cluster" {
  name = "${var.environment}-ecs-cluster"
}