resource "aws_launch_configuration" "enve-webapp-lc" {
  name_prefix   = "enve-webapp-lc-"
  image_id        = "ami-0ac80df6eff0e70b5"
  instance_type   = "t2.micro"
  key_name        = "enve-labs-key"
  security_groups = [aws_security_group.enve-webapp-sg.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "<h1>Hello world, welcome to terraform labs</h1>" > index.html
              nohup busybox httpd -f -p ${var.webapp_port} &
              EOF

  lifecycle {
    create_before_destroy = true
  }

}
