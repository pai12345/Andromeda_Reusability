locals {
  global_vars = yamldecode(file("./global/global.yml"))
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  terraform {
    required_providers {
      aws = {
      source = "${local.global_vars.aws.source}"
      version = "${local.global_vars.aws.version}"
      }
    }
  }
  EOF
}