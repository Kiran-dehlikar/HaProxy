aws_region = "ap-northeast-1"
pub_aws_az = "ap-northeast-1a"
pri_aws_az = ["ap-northeast-1c","ap-northeast-1d"]
#=================================================================================#
# AMI 
ami_image_flavor = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
#["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
ami_image_virt_type = "hvm"
ami_image_owner_id = "099720109477" # Canonical
#=================================================================================#
# VPC
cidr_blocks = "0.0.0.0/0"
vpc_cidr = "10.0.0.0/16"
instance_tenency = "default"
vpc_tag = "ha-vpc"
#=================================================================================#
# SUBNET
public_subnet_tag = "ha-public-subnet"
public_subnet_cidr = "10.0.0.0/18"
private_subnet_cidr = ["10.0.64.0/18","10.0.128.0/18"]
private_subnet_tag = ["ha-pri-sub-1","ha-pri-sub-1"]
#=================================================================================#
# IGW Gateway
igw_tag = "ha-igw"
#=================================================================================#
# NAT Gateway
nat_tag = "ha-nat"
#=================================================================================#
# Route table
public_route_tag = "ha-public-route"
private_route_tag = "ha-private-route"
#=================================================================================#
# KEY PAIR 
public_key_pair = "tokyo_key"
private_key_name = "tokyo_key.pem"
# default_public_key = "~/.ssh/id_rsa.pub" # Replace with the path to your public key
#=================================================================================#
# SECURITY GROUP
ha_sg_name = "ha-sg"
ha_ingress_ports = [22,80,443,8080,8404]
egress_ports = [0]
ingress_protocol = "tcp" 
egress_protocol = "-1"
web_sg_name = "webserver-sg"
web_ingress_ports = [ 22,80 ]
#=================================================================================#
# INSTANCE 
public_instance_tag = "bashian-host"
ha_instance_tag = [ "haproxy_az1","haproxy_az2" ]
web_instance_tag = [ "web-1","web-2" ]
instance_type = "t2.micro"
instance_tag_key = "Name"
instance_tag_value = [ "haproxy*" ]
#=================================================================================#
# TARGET GROUP
ha_tg_name = "ha-tg"
ha_tg_port = 80
ha_tg_protocol = "HTTP"
#=================================================================================#
# LOAD BALANCER
ha_lb_name = "ha-lb"
ha_lb_type = "application"
ha_lb_port = 80