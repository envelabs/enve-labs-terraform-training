resource "aws_launch_configuration" "enve-webapp-lc" {
  name            = "enve-webapp-lc"
  image_id        = "ami-01de8ddb33de7a3d3"
  instance_type   = "t2.micro"
  key_name        = "enve-labs-key"
  security_groups = [aws_security_group.enve-webapp-sg.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "<h3>Hello world, welcome to terraform labs from $(hostname) </h3>" > index.html
              nohup busybox httpd -f -p ${var.webapp_port} &
              EOF

  lifecycle {
    create_before_destroy = true
  }

}
