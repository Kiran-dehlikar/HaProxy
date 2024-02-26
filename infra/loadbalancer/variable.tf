variable "ha_lb_name" {
}
variable "ha_lb_type" { 
}
variable "ha_tg_arn" {
}
variable "web_sec_groups" {
  type = string
}
variable "ha_instance_id" { # "instance_id"
  type = list(string)
  # Add validation and default value if needed
}
variable "ha_lb_port" { # 80
}
variable "subnet_ids" {
  type = list(string)
}
