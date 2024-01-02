locals {
  account_vars = jsondecode(file("${path_relative_to_include()}/accounts.json"))
  environment_vars = jsondecode(file("${path_relative_to_include()}/params.json"))
  stage            = local.environment_vars.environment
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
        provider "aws" {
          region = "${local.account_vars.aws_region}"
        }
EOF
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    profile        = "terraform-state"
    bucket         = local.account_vars.s3_bucket
    key            = "${local.environment_vars.environment}/your_demo_service"
    region         = local.account_vars.aws_region
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}

terraform {
  source = "../"
}

inputs = merge (
  local.account_vars,
  local.environment_vars,
  local
)