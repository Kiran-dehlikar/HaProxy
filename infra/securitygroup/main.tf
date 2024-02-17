resource "aws_security_group" "ha_security_group" {
  name        = var.ha_sec_groups_name
  vpc_id      = var.myvpc

  dynamic "ingress" {
    for_each = var.ha_ingress_ports

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = var.ingress_protocol
      cidr_blocks = var.cidr_blocks
    }
  }
  dynamic "egress" {
    for_each = var.egress_ports

    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = var.egress_protocol
      cidr_blocks = var.cidr_blocks
    }
  }
}

resource "aws_security_group" "web_security_group" {
  name        = var.web_sec_groups_name
  vpc_id      = var.myvpc
  dynamic "ingress" {
    for_each = var.web_ingress_ports

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = var.ingress_protocol
      cidr_blocks = var.cidr_blocks
    }
  }
  dynamic "egress" {
    for_each = var.egress_ports

    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = var.egress_protocol
      cidr_blocks = var.cidr_blocks
    }
  }
}
resource "aws_security_group" "bastion_security_group" {
  name        = var.bastion_sec_groups_name
  vpc_id      = var.myvpc
  dynamic "ingress" {
    for_each = var.bastion_ingress_ports

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = var.ingress_protocol
      cidr_blocks = var.cidr_blocks
    }
  }
  dynamic "egress" {
    for_each = var.egress_ports

    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = var.egress_protocol
      cidr_blocks = var.cidr_blocks
    }
  }
}