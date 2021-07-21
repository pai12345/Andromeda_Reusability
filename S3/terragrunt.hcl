generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  terraform {
    required_providers {
      aws = {
      source = "hashicorp/aws"
      version = "3.50.0"
      }
    }
  }
  EOF
}