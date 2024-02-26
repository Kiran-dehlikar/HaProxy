#======================= Create Subnet================================#

#=> PRIVATE SUBNET
resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnet_tag)
  vpc_id                  = var.myvpc
  cidr_block              = var.private_subnet_cidr[count.index]
  availability_zone       = var.pri_aws_az[count.index]
  map_public_ip_on_launch = false
  tags = {
    Name = var.private_subnet_tag[count.index]
  }
}

#=> PUBLIC SUBNET
resource "aws_subnet" "public_subnets" {
  vpc_id                  = var.myvpc
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.pub_aws_az
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_tag
  }
}
