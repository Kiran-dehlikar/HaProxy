resource "aws_key_pair" "public_key_pair" {
  key_name   = var.public_key_pair
  public_key = tls_private_key.private_key.public_key_openssh
  #public_key = file(var.default_public_key)
} 

# RSA key of size 4096 bits
resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key_file" {
  content  = tls_private_key.private_key.private_key_pem
  filename = var.private_key_name
}
resource "null_resource" "change_permissions" {
  triggers = {
    private_key_content = local_file.private_key_file.content
  }

  provisioner "local-exec" {
    command = "chmod 400 ./${var.private_key_name}"
  }
}