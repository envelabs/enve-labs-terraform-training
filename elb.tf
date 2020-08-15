resource "aws_elb" "enve-webapp-elb" {
  name               = "enve-webapp-elb"
  # todo
  # subnets            = [data.aws_subnet_ids.all.ids]
  # subnets            = ["subnet-06f02c71", "subnet-3707191f"]
  # todo
  # availability_zones = [data.aws_availability_zones.all.names]
  availability_zones = ["us-east-1a","us-east-1c"]
  security_groups    = [aws_security_group.enve-webapp-elb-sg.id]

  listener {
    instance_port      = var.http_port
    instance_protocol  = "http"
    lb_port            = 8080
    lb_protocol        = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:8080/"
  }

  # instances             = [aws_instance.enve-webapp-srvr1.id]
  idle_timeout          = 400

  tags = {
    Name = "enve-webapp-elb"
  }

}
