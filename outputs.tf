output "enve-webapp-srvr" {
  description = "New domain assigned to the enve webapp stack"
  value       = aws_elb.enve-webapp-elb.dns_name
}
