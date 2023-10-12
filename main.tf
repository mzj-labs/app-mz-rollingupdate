terraform {
  required_version = ">=0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_ssm_parameter" "app_cpu" {
  name = "/${var.project}/${var.env}/${var.suffix}/app_cpu"
}

data "aws_ssm_parameter" "app_memory" {
  name = "/${var.project}/${var.env}/${var.suffix}/app_memory"
}

data "aws_ssm_parameter" "app_execution_role_arn" {
  name = "/${var.project}/${var.env}/${var.suffix}/app_execution_role_arn"
}

data "aws_ssm_parameter" "app_container_port" {
  name = "/${var.project}/${var.env}/${var.suffix}/app_container_port"
}

data "aws_ssm_parameter" "app_desired_count" {
  name = "/${var.project}/${var.env}/${var.suffix}/app_desired_count"
}
data "aws_ssm_parameter" "app_deployment_minimum_healthy_percent" {
  name = "/${var.project}/${var.env}/${var.suffix}/app_deployment_minimum_healthy_percent"
}
data "aws_ssm_parameter" "app_deployment_maximum_percent" {
  name = "/${var.project}/${var.env}/${var.suffix}/app_deployment_maximum_percent"
}
data "aws_ssm_parameter" "app_healthcheck_period" {
  name = "/${var.project}/${var.env}/${var.suffix}/app_healthcheck_period"
}
data "aws_ssm_parameter" "app_env1" {
  name = "/${var.project}/${var.env}/${var.suffix}/env1"
}
data "aws_ssm_parameter" "app_env2" {
  name = "/${var.project}/${var.env}/${var.suffix}/env2"
}
data "aws_lb_target_group" "ecs_tg" {
  name = "${var.project}-${var.env}-${var.suffix}"
}
data "aws_security_group" "ecs_sg" {
  name = "${var.project}-${var.env}-${var.suffix}"
}
data "aws_subnet" "public_subnet_1a" {
  filter {
    name   = "tag:Name"
    values = ["${var.project}-${var.env}-public-a"]
  }
}
data "aws_subnet" "public_subnet_1c" {
  filter {
    name   = "tag:Name"
    values = ["${var.project}-${var.env}-public-c"]
  }
}
data "aws_ecs_cluster" "ecs_cluster" {
  cluster_name = "${var.project}-${var.env}-${var.suffix}"
}
