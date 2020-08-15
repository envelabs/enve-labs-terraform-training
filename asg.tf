resource "aws_autoscaling_group" "enve-webapp-asg" {
  launch_configuration = aws_launch_configuration.enve-webapp-lc.name
  availability_zones = ["us-east-1a","us-east-1c"]
  # todo
  # availability_zones = [data.aws_availability_zones.all.names]
  load_balancers= [aws_elb.enve-webapp-elb.id]
  health_check_type="ELB"

  min_size = 2
  max_size = 5

  tag {
    key                 = "Name"
    value               = "enve-webapp-srvr"
    propagate_at_launch = true
  }
}