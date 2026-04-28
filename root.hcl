terraform_binary = "terraform"

locals {
  environment_vars = jsondecode(file("${path_relative_to_include()}/params.json"))
  environment = basename(get_terragrunt_dir())
}

terraform {
  source = "${get_parent_terragrunt_dir()}/terraform"
}

generate "backend" {
  path      = "backend.tf"       # The file Terragrunt will create
  if_exists = "overwrite"        # Overwrite if it already exists
  contents  = <<EOF
terraform {
  backend "local" {
    path = "${get_parent_terragrunt_dir()}/application_${local.environment}.tfstate"
  }
}
EOF
}

inputs = merge (
  local.environment_vars,
  local
)