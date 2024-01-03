locals {
  environment_vars = jsondecode(file("${path_relative_to_include()}/params.json"))
  environment = basename(get_terragrunt_dir())
}

terraform {
  source = "../"
}

inputs = merge (
  local.environment_vars,
  local
)