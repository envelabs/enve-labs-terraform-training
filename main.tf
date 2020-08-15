provider "aws" {
  region  = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_availability_zones" "all" {
  vpc_id = "${data.aws_vpc.default.id}"
}

data "aws_subnet_ids" "all" {
  vpc_id = "${data.aws_vpc.default.id}"
}

