moved {
  from = aws_instance.practice_server
  to   = aws_instance.devops_terraform_control
}

resource "aws_instance" "devops_terraform_control" {
  ami           = "ami-05a1f40ec1f9ea141"
  instance_type = var.instance_type

  tags = {
    Name        = var.instance_name
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "aws-devops-practice"
  }

  lifecycle {
    ignore_changes = [
      tags["Name"]
    ]
  }
}
resource "aws_instance" "devops_terraform_nodes" {
  count = 3

  ami           = "ami-05a1f40ec1f9ea141"
  instance_type = var.instance_type

  tags = {
    Name        = "devops-terraform-node0${count.index + 1}"
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "aws-devops-practice"
  }
}
