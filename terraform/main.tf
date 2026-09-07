resource "aws_instance" "devops_terraform_nodes" {
  for_each = {
    node01 = "t3.micro"
    node02 = "t3.small"
    node03 = "t3.micro"
  }

  ami           = "ami-05a1f40ec1f9ea141"
  instance_type = each.value

  tags = {
    Name        = "devops-terraform-${each.key}"
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "aws-devops-practice"
  }
}
