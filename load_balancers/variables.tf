# load balancer

variable "health_check_path" {
  description = "Health check path for the default target group"
  default     = "/ping/"
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "production"
}

variable "aws_security_group" {}
variable "public_subnet_2" {}
variable "public_subnet_1" {}
variable "production_vpc_id" {}