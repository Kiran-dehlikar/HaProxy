output "ha_security_groups_out" {
  value = aws_security_group.ha_security_group.id
  description = "Security Group ID of HaProxy server"
}
output "web_security_groups_out" {
  value = aws_security_group.web_security_group.id
  description = "Security Group ID of webserver"
}
