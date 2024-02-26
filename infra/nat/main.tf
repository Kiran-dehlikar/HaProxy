#===================== Create NAT Gateway ============================#

# Elastic IP (EIP) for NAT Gateway
resource "aws_eip" "nat_eip" {
  instance = null
}

resource "aws_nat_gateway" "mynat" {
  allocation_id = var.eip_nat
  #subnet_id     = aws_subnet.public_subnets[0].id
  subnet_id = var.public_subnets
  tags = {
    Name = var.nat_tag
  }
}
