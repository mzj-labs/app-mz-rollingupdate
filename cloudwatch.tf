data "aws_cloudwatch_log_group" "cloudwatch_log_group_ecs" {
  name              = "/aws/ecs/${var.project}-${var.env}/${var.suffix}"
}

