terraform {     
  source = "git::ssh://git@github.com/pai12345/Andromeda_Terraform.git//S3?ref=v0.0.3"
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