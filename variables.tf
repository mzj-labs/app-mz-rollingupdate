variable "aws_region" {}

variable "project" {
  type = string
  default = "um"
}

variable "env" {
  type = string
}

variable "suffix" {
  type = string
}

variable "account" {
  type = string
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "public_a_cidr" {
  type = string
  default = "10.0.1.0/24"
}

variable "public_b_cidr" {
  type = string
  default = "10.0.2.0/24"
}

variable "public_c_cidr" {
  type = string
  default = "10.0.3.0/24"
}

variable "public_d_cidr" {
  type = string
  default = "10.0.4.0/24"
}

variable "public_e_cidr" {
  type = string
  default = "10.0.5.0/24"
}

variable "public_f_cidr" {
  type = string
  default = "10.0.6.0/24"
}

variable "private_a_cidr" {
  type = string
  default = "10.0.11.0/24"
}

variable "private_b_cidr" {
  type = string
  default = "10.0.12.0/24"
}

variable "private_c_cidr" {
  type = string
  default = "10.0.13.0/24"
}

variable "private_d_cidr" {
  type = string
  default = "10.0.14.0/24"
}

variable "private_e_cidr" {
  type = string
  default = "10.0.15.0/24"
}

variable "private_f_cidr" {
  type = string
  default = "10.0.16.0/24"
}

variable "ecs-image" {
  type = string
}

data "aws_region" "current" {}

locals {
  region = data.aws_region.current.name
}

