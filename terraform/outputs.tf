output "instance_id" {
  description = "ID of the Terraform-created EC2 instance"
  value       = aws_instance.devops_terraform_control.id
}

output "private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.devops_terraform_control.private_ip
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.devops_terraform_control.public_ip
}

