generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  terraform {
    required_providers {
      local = {
        source = "hashicorp/local"
        version = "2.1.0"
      }
    }
  }
  EOF
}