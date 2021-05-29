provider "aws" {
  region  = "us-east-1"
}

data "aws_availability_zones" "all" {}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

# bucket for terraform state
#terraform {
#  backend "s3" {
#    region = "us-east-1"
#    bucket = "enve-labs-tf-state"
#    key    = "enve-labs-dev-tf-state"
#  }
#}
