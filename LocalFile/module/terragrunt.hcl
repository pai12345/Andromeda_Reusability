terraform {
  # source = "git::git@github.com:pai12345/Andromeda_Terraform.git//LocalFile?ref=v0.0.1"      
  source = "git::ssh://git@github.com/pai12345/Andromeda_Terraform.git//LocalFile?ref=v0.0.2"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  content = "Hello World"
  directorypermission  = "0777"
}