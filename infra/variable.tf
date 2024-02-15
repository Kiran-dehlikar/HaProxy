# AWS Region and Availability Zone
variable "aws_region" {
  type    = string
}

# All traffic cidr block 
variable "cidr_blocks" {
  type = string
}
#=================================================================================#
# VPC BLOCK
variable "vpc_cidr" {
  type    = string
}
variable "instance_tenency" {
  type    = string
}
variable "vpc_tag" {
  type    = string
}
#=================================================================================#
# SUBNET BLOCK

# PRIVATE SUBNET
variable "pri_aws_az" {
  type = list(string)
}
variable "private_subnet_cidr" {
  type = list(string)
}
variable "private_subnet_tag" {
  type = list(string)
}
# PUBLIC SUBNET
variable "pub_aws_az" {
  type = string
}
variable "public_subnet_cidr" {
  type = string
}
variable "public_subnet_tag" {
  type = string
}
#=================================================================================#
# IGW
variable "igw_tag" {
  type = string
}
#=================================================================================#
# NAT
variable "nat_tag" {
  type = string
}
#=================================================================================#
# Route Table
variable "public_route_tag" {
  type = string
}
variable "private_route_tag" {
  type = string
}
#=================================================================================#
# AMI 
variable "ami_image_flavor" {
  type = string
}
variable "ami_image_virt_type" {
  type = string
}
variable "ami_image_owner_id" {
  type = string
}
#=================================================================================#
# KEY PAIR
variable "public_key_pair" {
  type = string
}
variable "private_key_name" {
  type = string
}

#=================================================================================#
# Security Groups
variable "ha_sg_name" {
  type = string
}
variable "ha_ingress_ports" {
  type        = list(number)
}
variable "egress_ports" {
  type        = list(number)
}
variable "ingress_protocol" {
  type = string
}
variable "egress_protocol" {
  type  = string
}
variable "web_sg_name" {
  type = string
}
variable "web_ingress_ports" {
  type        = list(number)
}
#=================================================================================#
# INSTANCE
# Instance Name
variable "public_instance_tag" {
  type = string
}
variable "ha_instance_tag" {
  type = list(string)
}
variable "web_instance_tag" {
  type = list(string)
}
# Instance Type
variable "instance_type" {
  type = string
}
variable "instance_tag_key" {
  type = string
}
variable "instance_tag_value" {
  type = list(string)
}
#=================================================================================#
# TARGET GROUP
variable "ha_tg_name" {
}
variable "ha_tg_port" { # 80
}
variable "ha_tg_protocol" { # "HTTP"
}
#=================================================================================#
# LOAD BALANCER
variable "ha_lb_name" {
}
variable "ha_lb_type" { 
}
variable "ha_lb_port" { 
}

