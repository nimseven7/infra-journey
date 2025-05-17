output "ec2_app_server" {
  value = aws_instance.app_server
}

output "domain_id" {
  value = data.gandi_domain.nimseven.id
}