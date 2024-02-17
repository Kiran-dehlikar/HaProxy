# Public EC2 Instance
resource "aws_instance" "public_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id 
  key_name               = var.key  # Change this to your key pair name
  associate_public_ip_address = true
  security_groups = [var.bastion_security_group] #[ aws_security_group.my_security_group.id ]

  tags = {
    Name = var.public_instance_tag
  }
}

# Private EC2 Instance
resource "aws_instance" "haProxy_instance" {
  count = length(var.private_subnet_id)
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id[count.index] #aws_subnet.private_subnets[count.index].id
  key_name               = var.key  # Change this to your key pair name
  associate_public_ip_address = false
  security_groups = [var.ha_sec_groups] #[ aws_security_group.my_security_group.id ]

  tags = {
    Name = var.haProxy_instance_tag[count.index]
  }
} 

resource "aws_instance" "webserver_instance" {
  count = var.web_instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id[count.index % 2] # Distribute instances evenly across subnets
  key_name               = var.key  # Change this to your key pair name
  associate_public_ip_address = false
  security_groups = [var.web_sec_groups] #[ aws_security_group.my_security_group.id ]

  tags = {
    Name = var.webserver_instance_tag[count.index]
  }
} 

