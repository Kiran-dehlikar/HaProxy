#========================== Create IGW ===============================#
resource "aws_internet_gateway" "myigw" {
  vpc_id = var.myvpc
  tags = {
    Name = var.igw_tag
  }
}
