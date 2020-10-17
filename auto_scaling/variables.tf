variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "production"
}

variable "autoscale_min" {
  description = "Minimum autoscale (number of EC2)"
  default     = "1"
}
variable "autoscale_max" {
  description = "Maximum autoscale (number of EC2)"
  default     = "2"
}
variable "autoscale_desired" {
  description = "Desired autoscale (number of EC2)"
  default     = "2"
}
variable "aws_launch_configuration_var" {}
variable "public_subnet_1" {}
variable "public_subnet_2" {}