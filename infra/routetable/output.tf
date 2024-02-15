output "rt_pub_out" {
  value = aws_route_table.public_route_table.id
  description = "Public route table ID"
}

output "rt_pri_out" {
  value = aws_route_table.private_route_table.id
  description = "Private route table ID"
}
