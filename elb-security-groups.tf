resource "aws_security_group" "enve-webapp-elb-sg" {
  name = "enve-webapp-elb-sg"
  description = "allow inbound traffic to enve-webapp-elb"

  ingress {
    from_port   = 8080
    to_port     = 8080
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