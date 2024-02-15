resource "aws_lb_target_group" "my_target_group" {
  name        = var.ha_tg_name
  port        = var.ha_tg_port
  protocol    = var.ha_tg_protocol
  vpc_id      = var.myvpc
}