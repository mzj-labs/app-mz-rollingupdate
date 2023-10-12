resource "aws_ecs_task_definition" "app" {
  family                   = "${var.project}-${var.env}-${var.suffix}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = data.aws_ssm_parameter.app_cpu.value
  memory                   = data.aws_ssm_parameter.app_memory.value
  execution_role_arn       = data.aws_ssm_parameter.app_execution_role_arn.value

  container_definitions = jsonencode([
    {
      "name": "${var.project}-${var.env}-${var.suffix}",
      "image": "${var.ecs-image}",
      "essential": true,
      "cpu": tonumber(data.aws_ssm_parameter.app_cpu.value),
      "command": ["/opt/env-leaker/env-leaker", "--output", "http", "--port", "8080"]
      "portMappings": [
        {
          "containerPort": tonumber(data.aws_ssm_parameter.app_container_port.value),
          "hostPort": tonumber(data.aws_ssm_parameter.app_container_port.value)
        }
      ],
      "environment": [
        {
          "name": "ENV1",
          "valueFrom": data.aws_ssm_parameter.app_env1.arn
        },
        {
          "name": "ENV2",
          "valueFrom": data.aws_ssm_parameter.app_env2.arn
        }
      ]
    }
  ])
}
