resource "aws_autoscaling_group" "enve-webapp-asg" {
  launch_configuration = aws_launch_configuration.enve-webapp-lc.name
  availability_zones = ["us-east-1a"]

  min_size = 4
  max_size = 5

  tag {
    key                 = "Name"
    value               = "enve-webapp-srvr"
    propagate_at_launch = true
  }
}
