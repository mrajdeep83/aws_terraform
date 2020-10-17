resource "aws_cloudwatch_log_group" "python-log-group" {
  name              = "/ecs/python-app"
  retention_in_days = var.log_retention_in_days
}

resource "aws_cloudwatch_log_stream" "python-log-stream" {
  name           = "python-app-log-stream"
  log_group_name = aws_cloudwatch_log_group.python-log-group.name
}

resource "aws_cloudwatch_log_group" "nginx-log-group" {
  name              = "/ecs/nginx"
  retention_in_days = var.log_retention_in_days
}

resource "aws_cloudwatch_log_stream" "nginx-log-stream" {
  name           = "nginx-log-stream"
  log_group_name = aws_cloudwatch_log_group.nginx-log-group.name
}