# Instance Name
variable "public_instance_tag" {
  type = string
}
variable "webserver_instance_tag" {
  type = list(string)
}
# Instance Type
variable "instance_type" {
  type = string
}
# Key Pair
variable "key" {
  type = string
}
variable "ami_id" {
  type = string
}
variable "public_subnet_id" {
  type = string
}
variable "private_subnet_id" {
  type = list(string)
}
variable "ha_sec_groups" {
  type = string
}
variable "haProxy_instance_tag" {
  type = list(string)
}
variable "web_sec_groups" {
  type = string
}
variable "tag_key" {
  type  = string
}
variable "tag_values" {
  type  = list(string)
}
variable "bastion_security_group" {
  type = string
}
variable "web_instance_count" {
  type = number
}