terraform {     
  source = "git::ssh://git@github.com/pai12345/Andromeda_Terraform.git//S3?ref=v0.0.6"
  extra_arguments "conditional_vars" {
    commands = [
      "refresh",
      "plan",
      "apply",
      "destroy",
    ]
    required_var_files = [
      "${get_parent_terragrunt_dir()}/variables.tfvars"
    ]
  }
}

include {
  path = find_in_parent_folders()
}

inputs = {
  bucket = "andrbucketgrunt"
  acl    = "private"
  tags = {
    Type        = "S3 Bucket"
    Environment = "Andromeda"
  }
}