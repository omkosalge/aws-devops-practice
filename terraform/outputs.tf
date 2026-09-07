output "instance_ids" {
  value = {
    for key, instance in aws_instance.devops_terraform_nodes :
    key => instance.id
  }
}

output "private_ips" {
  value = {
    for key, instance in aws_instance.devops_terraform_nodes :
    key => instance.private_ip
  }
}

output "public_ips" {
  value = {
    for key, instance in aws_instance.devops_terraform_nodes :
    key => instance.public_ip
  }
}
