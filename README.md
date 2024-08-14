# Terragrunt Demo

## Getting started

This project assumes you have gathered some initial experience using Terraform/OpenTofu to create and maintain your infrastructure.

Install Terraform according to their docs:
[Terraform](https://www.terraform.io)

Or use OpenTofu as a replacement for Terraform:
[OpenTofu](https://opentofu.org)

You can find all necessary steps to install Terragrunt here:
[Terragrunt](https://terragrunt.gruntwork.io)

We are using `tfenv` for managing the Terraform binary
[tfenv](https://github.com/tfutils/tfenv.git)

We are using `tgenv` for managing the Terragrunt binary
[tgenv](https://github.com/cunymatthieu/tgenv.git)

## Running Terragrunt

Install the needed `terraform` version according to `.terraform-version`:

`tfenv install`

Install the needed `terragrunt` version according to `.terragrunt-version`:

`tgenv install`

According to the chosen environment, one would execute `terragrunt` like so:

Creating a plan to see what would have been executed:

`cd environment/nonlive && terragrunt plan`

Execute the plan:

`cd environment/nonlive && terragrunt apply`
