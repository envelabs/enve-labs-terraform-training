resource "aws_security_group" "enve-webapp-sg" {
  name        = "enve-webapp-sg"
  vpc_id      = aws_vpc.enve-labs-vpc.id
  description = "enve webapp security group"

  # access for ssh
  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # access for webapp
  ingress {
    from_port   = var.webapp_port
    to_port     = var.webapp_port
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
    Name = "enve-webapp-sg"
  }
}

