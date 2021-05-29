resource "aws_instance" "enve-webapp-srvr1" {
  ami                    = "ami-09e67e426f25ce0d7"
  instance_type          = "t2.micro"
  key_name               = "enve-labs-key"
  subnet_id              = aws_subnet.enve-labs-pub-sn-a.id
  vpc_security_group_ids = [aws_security_group.enve-webapp-sg.id]

  root_block_device {
    volume_size = "8"
  }

  user_data = <<-EOF
              #!/bin/bash
              echo "<h1>Hello world, welcome to terraform labs... and now with our own domain envelabs.com</h1>" > index.html
              nohup busybox httpd -f -p ${var.http_port} &
              EOF

  tags = {
    Name = "enve-webapp-srvr1"
    env  = "dev"
  }
}
