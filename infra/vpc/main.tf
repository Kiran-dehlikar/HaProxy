#======================= Create VPC ==================================#
resource "aws_vpc" "myvpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.instance_tenency

  tags = {
    Name = var.vpc_tag
  }
}