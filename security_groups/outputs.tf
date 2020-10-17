output "aws_security_group" {
  value = aws_security_group.load-balancer.id
}

output "aws_security_group_ecs" {
  value = aws_security_group.ecs.id
}
