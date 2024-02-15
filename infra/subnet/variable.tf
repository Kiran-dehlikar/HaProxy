# PRIVATE SUBNET

variable "private_subnet_cidr" {
  type = list(string)
}

variable "private_subnet_tag" {
  type = list(string)
}

##===================================================================================##
# PUBLIC SUBNET
variable "public_subnet_cidr" {
  type = string
}

variable "public_subnet_tag" {
  type = string
}

variable "pub_aws_az" {
  type = string
}
variable "pri_aws_az" {
  type = list(string)
}

variable "myvpc" {
  type = string
}