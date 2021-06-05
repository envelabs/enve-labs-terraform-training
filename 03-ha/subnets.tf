# public subnet for az a
resource "aws_subnet" "enve-labs-pub-sn-a" {
  vpc_id                  = aws_vpc.enve-labs-vpc.id
  cidr_block              = var.subnet-cidr-pub-a
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name        = "enve-labs-pub-sn-a"
    env         = "dev"
  }
}

resource "aws_route_table" "enve-labs-rt-pub-sub-a" {
  vpc_id = aws_vpc.enve-labs-vpc.id

  tags = {
    Name        = "enve-labs-rt-pub-sub-a"
    env         = "dev"
  }
}

resource "aws_route" "enve-labs-inet-pub-route-a" {
  route_table_id         = aws_route_table.enve-labs-rt-pub-sub-a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.enve-labs-igw.id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table_association" "enve-labs-rt-pub-assoc-a" {
  subnet_id      = aws_subnet.enve-labs-pub-sn-a.id
  route_table_id = aws_route_table.enve-labs-rt-pub-sub-a.id

  lifecycle {
    ignore_changes = [
      subnet_id,
      route_table_id,
    ]
    create_before_destroy = true
  }
}

# public subnet for az b
resource "aws_subnet" "enve-labs-pub-sn-b" {
  vpc_id                  = aws_vpc.enve-labs-vpc.id
  cidr_block              = var.subnet-cidr-pub-b
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"

  tags = {
    Name        = "enve-labs-pub-sn-b"
    env         = "dev"
  }
}

resource "aws_route_table" "enve-labs-rt-pub-sub-b" {
  vpc_id = aws_vpc.enve-labs-vpc.id

  tags = {
    Name        = "enve-labs-rt-pub-sub-b"
    env         = "dev"
  }
}

resource "aws_route" "enve-labs-inet-pub-route-b" {
  route_table_id         = aws_route_table.enve-labs-rt-pub-sub-b.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.enve-labs-igw.id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table_association" "enve-labs-rt-pub-assoc-b" {
  subnet_id      = aws_subnet.enve-labs-pub-sn-b.id
  route_table_id = aws_route_table.enve-labs-rt-pub-sub-b.id

  lifecycle {
    ignore_changes = [
      subnet_id,
      route_table_id,
    ]
    create_before_destroy = true
  }
}
