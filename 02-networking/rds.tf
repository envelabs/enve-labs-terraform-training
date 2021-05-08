resource "aws_db_subnet_group" "enve-labs-rds-sng" {
  name       = "enve-labs-rds-sng"
  subnet_ids = [aws_subnet.enve-labs-pub-sn-a.id, aws_subnet.enve-labs-pub-sn-b.id]

  tags = {
    Name = "enve-labs-rds-sng"
  }
}

resource "aws_db_instance" "enve-labs-rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "enve"
  username             = "enve"
  password             = "envelabs"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = "true"
  vpc_security_group_ids  = [aws_security_group.aws-enve-labs-rds-sg.id]
  db_subnet_group_name = aws_db_subnet_group.enve-labs-rds-sng.id
}
