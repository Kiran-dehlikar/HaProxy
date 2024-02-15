# Route Table
variable "public_route_tag" {
  type = string
}

variable "private_route_tag" {
  type = string
}

variable "myvpc" {
  type = string
}
variable "myigw" {
  type = string
}
variable "mynat" {
  type = string
}

variable "public_subnets" {
  type = string
}
variable "private_subnets" {
  type = list(string)
}
variable "cidr_blocks" {
  type = string
}