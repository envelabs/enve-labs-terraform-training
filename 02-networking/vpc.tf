resource "aws_vpc" "enve-labs-vpc" {
  cidr_block           = var.enve-labs-vpc-cidr
  enable_dns_hostnames = "true"

  tags = {
    Name        = "enve-labs-vpc"
    env         = "dev"
  }
}

resource "aws_internet_gateway" "enve-labs-igw" {
  vpc_id = aws_vpc.enve-labs-vpc.id

  tags = {
    Name        = "enve-labs-igw"
    env         = "dev"
  }
}
