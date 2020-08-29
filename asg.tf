resource "aws_autoscaling_group" "enve-webapp-asg" {
  launch_configuration = aws_launch_configuration.enve-webapp-lc.name
  vpc_zone_identifier  = [aws_subnet.enve-labs-pub-sn-a.id, aws_subnet.enve-labs-pub-sn-b.id]

  min_size = 2
  max_size = 6

  load_balancers= [aws_elb.enve-webapp-elb.id]
  health_check_type="ELB"

  tag {
    key                 = "Name"
    value               = "enve-webapp-srvr"
    propagate_at_launch = true
  }
}
