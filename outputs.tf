output "app_instance_id" {
  value = aws_instance.app.id
}

output "app_instance_public_ip" {
  value = aws_instance.app.public_ip
}
