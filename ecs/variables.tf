variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "production"
}
variable "amis" {
  description = "Which AMI to spawn."
  default = {
    us-west-1 = "ami-0025cead08302a9d5"
  }
}
variable "region" {
    default = "us-west-1"
}
variable "instance_type" {
    default = "t2.medium"
}
variable "aws_security_group_ecs" {}
variable "ecs_iam_instance" {}
variable "key_pair_name" {}

variable "docker_image_url_python" {
  default = "921007484764.dkr.ecr.us-west-1.amazonaws.com/rajdeep:latest"
}

variable "docker_image_url_nginx" {
  default = "921007484764.dkr.ecr.us-west-1.amazonaws.com/rajdeep_nginx:latest"
}

variable "app_count" {
  description = "Number of Docker containers to run"
  default     = 2
}
variable "ecs_iam_service" {}
variable "aws_alb_target_group_arn" {}
variable "private_subnet_1" {}
#variable "ecs_task_execution_role_arn" {}
variable "aws_alb_listener_var" {}
