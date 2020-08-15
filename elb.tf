resource "aws_elb" "enve-webapp-elb" {
  name               = "enve-webapp-elb"
  subnets            = [data.aws_availability_zones.all.names]
  security_groups    = [aws_security_group.enve-webapp-elb-sg.id]

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:8080/"
  }

  internal              = true
  instances             = [aws_instance.enve-webapp-srvr1.id]
  idle_timeout          = 400

  tags {
    Name = "enve-webapp-elb"
  }

}
