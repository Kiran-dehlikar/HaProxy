resource "aws_lb" "my_load_balancer" {
  name               = var.ha_lb_name
  internal           = false  # Set to true for internal ELB, false for internet-facing
  load_balancer_type = var.ha_lb_type

  security_groups    = [var.web_sec_groups]  # Set your security group ID
  subnets            =  var.subnet_ids  # Set your subnet IDs

  enable_deletion_protection = false  # Set to true if you want to enable deletion protection
}

# Attach the target group to the load balancer
resource "aws_lb_target_group_attachment" "my_attachment" {
  count = length(var.ha_instance_id)
  target_group_arn = var.ha_tg_arn
  target_id        = var.ha_instance_id[count.index]
  port             = var.ha_lb_port  
}


