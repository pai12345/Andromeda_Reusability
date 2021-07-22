locals {
  global_vars = yamldecode(file("./global/global.yml"))
}

remote_state {
  backend = "s3"
  generate = {
    path = "remote_backend.tf"
    if_exists = "overwrite"
  }
  disable_init = tobool(get_env("TERRAGRUNT_DISABLE_INIT", "false"))
  config = {
    bucket         = "${local.global_vars.remotestate.bucket}"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "${local.global_vars.remotestate.region}"
    encrypt        = "${local.global_vars.remotestate.encrypt}"
    dynamodb_table = "${local.global_vars.remotestate.dynamodb_table}"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  terraform {
    required_providers {
      local = {
        source = "${local.global_vars.localfile.source}"
        version = "${local.global_vars.localfile.version}"
      }
    }
  }
  EOF
}