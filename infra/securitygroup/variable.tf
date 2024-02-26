# Security Groups

variable "ha_sec_groups_name" {
  type = string
}
variable "ha_ingress_ports" {
  type  = list(number)
}
variable "egress_ports" {
  type  = list(number)
}
variable "ingress_protocol" {
  type = string
}
variable "egress_protocol" {
  type = string
}
variable "cidr_blocks" {
  type  = list(string)
}
variable "myvpc" {
  type = string
}
variable "web_sec_groups_name" {
  type = string
}
variable "web_ingress_ports" {
  type  = list(string)
}
variable "bastion_sec_groups_name" {
  type = string
}
variable "bastion_ingress_ports" {
  type  = list(string)
}