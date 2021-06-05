resource "aws_elb" "enve-webapp-elb" {
  name               = "enve-webapp-elb"
  security_groups    = [aws_security_group.enve-webapp-elb-sg.id]
  subnets            = [aws_subnet.enve-labs-pub-sn-a.id,aws_subnet.enve-labs-pub-sn-b.id]


  listener {
    lb_port            = var.http_port
    lb_protocol        = "http"
    instance_port      = var.webapp_port
    instance_protocol  = "http"
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
