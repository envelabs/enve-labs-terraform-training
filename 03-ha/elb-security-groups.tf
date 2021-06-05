resource "aws_security_group" "enve-webapp-elb-sg" {
  name = "enve-webapp-elb-sg"
  vpc_id      = aws_vpc.enve-labs-vpc.id
  description = "allow inbound traffic to enve-webapp-elb"

  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "enve-webapp-elb-sg"
  }
}
