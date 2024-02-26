
# AWS AMI for Instances
data "aws_ami" "images" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_image_flavor]
  }

  filter {
    name   = "virtualization-type"
    values = [var.ami_image_virt_type]
  }

  owners = [var.ami_image_owner_id]
}
