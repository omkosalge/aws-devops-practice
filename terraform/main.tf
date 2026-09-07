moved {
  from = aws_instance.practice_server
  to   = aws_instance.devops_terraform_control
}
moved {
  from = aws_instance.devops_terraform_nodes[0]
  to   = aws_instance.devops_terraform_nodes["node01"]
}

moved {
  from = aws_instance.devops_terraform_nodes[1]
  to   = aws_instance.devops_terraform_nodes["node02"]
}

moved {
  from = aws_instance.devops_terraform_nodes[2]
  to   = aws_instance.devops_terraform_nodes["node03"]
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
  depends_on = [
    aws_s3_bucket.dependency_bucket
  ]

  lifecycle {
    ignore_changes = [
      tags["Name"]
    ]
  }
}
resource "aws_instance" "devops_terraform_nodes" {
  for_each = toset([
    "node01",
    "node02",
    "node03"
  ])
  ami           = "ami-05a1f40ec1f9ea141"
  instance_type = var.instance_type

  tags = {
    Name        = "devops-terraform-${each.value}"
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "aws-devops-practice"
  }
}
