provider "aws" {
  region = "us-west-1"
}

module "vpc" {
  source          = "./vpc"
}

module "security_groups" {
  source          = "./security_groups"
  # production_vpc_id = "${module.vpc.production_vpc_id}"
  production_vpc_id = module.vpc.production_vpc_id
}

module "load_balancers" {
  source          = "./load_balancers"
  # production_vpc_id = "${module.vpc.production_vpc_id}"
  production_vpc_id = module.vpc.production_vpc_id
  # aws_security_group = "${module.security_groups.aws_security_group}"
  aws_security_group = module.security_groups.aws_security_group
  # public_subnet_1 = "${module.vpc.public_subnet_1}"
  public_subnet_1 = module.vpc.public_subnet_1
  # public_subnet_2 = "${module.vpc.public_subnet_2}"
  public_subnet_2 = module.vpc.public_subnet_2
}

module "iam" {
  source      = "./iam"
}

module "keypair" {
  source      = "./keypair"
}

module "ec2" {
   source         = "./ec2"
   #rajdeep_public_key  = "${module.keypair.key_pair}"
   rajdeep_public_key  = module.keypair.key_pair
   instance_type  = "t2.micro"
   #public_subnet_1  = "${module.vpc.public_subnet_1}"
   public_subnet_1 = module.vpc.public_subnet_1
  }

module "ecs" {
  source      = "./ecs"
  #aws_security_group = "${aws_security_group.load-balancer.id}"
  # aws_security_group_ecs = "${module.security_groups.aws_security_group_ecs}"
  aws_security_group_ecs = module.security_groups.aws_security_group_ecs
  # ecs_iam_instance = "${module.iam.ecs_iam_instance}"
  ecs_iam_instance = module.iam.ecs_iam_instance
  # key_pair_name = "${module.keypair.key_pair_name}"
  key_pair_name = module.keypair.key_pair_name  
  private_subnet_1 = module.vpc.private_subnet_1
  aws_alb_listener_var = module.load_balancers.aws_alb_listener_var
  aws_alb_target_group_arn = module.load_balancers.aws_alb_target_group_arn
  #ecs_task_execution_role_arn = module.iam.ecs_task_execution_role_arn
  ecs_iam_service =  module.iam.ecs_iam_service
}

module "auto_scaling" {
  source = "./auto_scaling"
  aws_launch_configuration_var = module.ecs.aws_launch_configuration_var
  public_subnet_1 = module.vpc.public_subnet_1
  public_subnet_2 = module.vpc.public_subnet_2
}

module "logs" {
  source          = "./logs"
}

