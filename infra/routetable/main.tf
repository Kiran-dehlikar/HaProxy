#================== Create Route Table ===============================#
# Public Route table

resource "aws_route_table" "public_route_table" {
  vpc_id = var.myvpc
  route {
    cidr_block = var.cidr_blocks
    gateway_id = var.myigw
  }
  tags = {
    Name = var.public_route_tag
  }
}

# Associate Public Route Table with Public Subnets
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id     = var.public_subnets
  #route_table_id = aws_route_table.public_route_table
  route_table_id = aws_route_table.public_route_table.id
}

#=====================================================================#
# Private Route table
resource "aws_route_table" "private_route_table" {
  vpc_id = var.myvpc
  route {
    cidr_block = var.cidr_blocks
    gateway_id = var.mynat
  }
  tags = {
    Name = var.private_route_tag
  }
}
# Associate Private Route Table with Private Subnets
resource "aws_route_table_association" "private_subnet_association" {
  count = length(var.private_subnets)
  subnet_id     = var.private_subnets[count.index]
  route_table_id = aws_route_table.private_route_table.id
}
