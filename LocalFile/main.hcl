terraform {
  source = "git::git@github.com:pai12345/Andromeda_Terraform.git//LocalFile?ref=v0.0.1"
            
}

inputs = {
  content = "Hello World"
  directorypermission  = "0777"
}