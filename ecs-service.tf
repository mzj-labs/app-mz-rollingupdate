#-----------------------------------------------------------------
# ECS Service
#-----------------------------------------------------------------

resource "aws_ecs_service" "ecs_service" {
  name                               = "${var.project}-${var.env}-${var.suffix}"
  launch_type                        = "FARGATE"
  cluster                            = data.aws_ecs_cluster.ecs_cluster.id
  task_definition                    = aws_ecs_task_definition.app.arn
  platform_version                   = "1.4.0"
  desired_count                      = data.aws_ssm_parameter.app_desired_count.value
  deployment_minimum_healthy_percent = data.aws_ssm_parameter.app_deployment_minimum_healthy_percent.value
  deployment_maximum_percent         = data.aws_ssm_parameter.app_deployment_maximum_percent.value
  health_check_grace_period_seconds  = data.aws_ssm_parameter.app_healthcheck_period.value
  force_new_deployment               = true
  network_configuration {
    subnets          = [data.aws_subnet.public_subnet_1a.id, data.aws_subnet.public_subnet_1c.id]
    security_groups  = [data.aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }
  load_balancer {
    target_group_arn = data.aws_lb_target_group.ecs_tg.arn
    container_name   = "${var.project}-${var.env}-${var.suffix}"
    container_port   = data.aws_ssm_parameter.app_container_port.value
  }
}
