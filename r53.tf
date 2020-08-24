resource "aws_route53_record" "enve-webapp-srvr1" {
  zone_id = "Z04164709DVPTWJDONB9"
  name    = "webapp.envelabs.com"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_elb.enve-webapp-elb.dns_name]
}
