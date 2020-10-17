resource "aws_ecs_cluster" "production" {
  name = "${var.ecs_cluster_name}-cluster"
}


resource "aws_launch_configuration" "ecs" {
  name                        = "${var.ecs_cluster_name}-cluster"
  image_id                    = lookup(var.amis, var.region)
  instance_type               = var.instance_type
  security_groups             = [var.aws_security_group_ecs]
  iam_instance_profile        = var.ecs_iam_instance
  key_name                    = var.key_pair_name
  associate_public_ip_address = true  
  user_data                   = "#!/bin/bash\necho ECS_CLUSTER='${var.ecs_cluster_name}-cluster' > /etc/ecs/ecs.config"
}

data "template_file" "app" {
  template = file("${path.module}/templates/python_app.json.tpl")

  vars = {
    docker_image_url_python = var.docker_image_url_python
    docker_image_url_nginx  = var.docker_image_url_nginx
    region                  = var.region
  }
}

resource "aws_ecs_task_definition" "app" {
  family                = "python-app"
  container_definitions = data.template_file.app.rendered  
  volume {
    name      = "static_volume"
    host_path = "/usr/src/app/staticfiles/"
  }
  tags = {
    Environment = "production"
    Application = "python-app"
  }
}

resource "aws_ecs_service" "production" {
  name            = "${var.ecs_cluster_name}-service"
  cluster         = aws_ecs_cluster.production.id
  task_definition = aws_ecs_task_definition.app.arn
  iam_role        = var.ecs_iam_service
  desired_count   = var.app_count
  depends_on      = [var.aws_alb_listener_var]

  load_balancer {
    target_group_arn = var.aws_alb_target_group_arn
    container_name   = "nginx"
    container_port   = 80
  }
  // network_configuration {
  //   security_groups  = [var.aws_security_group_ecs]
  //   subnets          = [var.private_subnet_1]
  // }
}