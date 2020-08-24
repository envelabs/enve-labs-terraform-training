provider "aws" {
  region  = var.region
}

data "aws_availability_zones" "all" {}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

# bucket for terraform state
terraform {
  backend "s3" {
    region = var.region
    bucket = var.enve-labs-tf-state
    key    = var.enve-labs-tf-state-key
  }
}
