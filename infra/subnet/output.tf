output "public_subnet_out" {
    value = aws_subnet.public_subnets.id

}

output "private_subnet_out" {
  value = aws_subnet.private_subnets[*].id
}
# Get the second value of private subnets from us-east-1b az
output "us-east-1b_az_subnet_id" {
  value = aws_subnet.private_subnets[1].id
}
