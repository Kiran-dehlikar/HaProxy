output "eip_out" {
  value = aws_eip.nat_eip.id
  description = "Elastic ip "
}
output "nat_out" {
  value = aws_nat_gateway.mynat.id
  description = "Nat Gateway id "
}

