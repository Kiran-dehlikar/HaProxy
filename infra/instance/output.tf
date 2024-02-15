output "haProxy_instance_id_out" {
  value = aws_instance.haProxy_instance[*].id
}
