resource "aws_route53_record" "enve-webapp-srvr1" {
  zone_id = "Z04164709DVPTWJDONB9"
  name    = "enve-webapp-srvr1.envelabs.com"
  #type    = "A"
  type    = "CNAME"
  ttl     = "300"
  # records = [aws_instance.enve-webapp-srvr1.public_ip]
  records = [aws_elb.enve-webapp-elb.dns_name]
}
