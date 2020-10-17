output "aws_alb_listener_var" {
    value = "${aws_alb_listener.ecs-alb-http-listener}"
}
output "aws_alb_target_group_arn" {
    value = "${aws_alb_target_group.default-target-group.arn}"
}