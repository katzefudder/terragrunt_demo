# Terragrunt Demo

## Why Terragrunt Instead of Terraform Workspaces?

This repository is a good example of why a team might choose Terragrunt over using Terraform workspaces alone.

### 1. Clear environment separation

Each environment has its own directory, such as `environments/dev` and `environments/live`, with its own `terragrunt.hcl` and `params.json`.

This makes the environment structure explicit in the filesystem. With Terraform workspaces, the active environment is often just an internal selection, which is easier to misuse by accident.

### 2. Shared configuration without duplication

Common configuration is centralized in `root.hcl`. The environment-specific `terragrunt.hcl` files only include that shared configuration.

This keeps the setup DRY and avoids repeating backend, source, and input wiring for every environment.

### 3. Separate state handling per environment

Terragrunt generates a backend configuration that writes a dedicated state file per environment.

In this repository, the state path is derived from the application name and environment name, which makes state separation predictable and easy to understand.

### 4. Terraform stays focused on infrastructure logic

The Terraform code in `terraform/` only defines the module inputs and resources. It does not need to contain workspace-specific branching logic.

That separation keeps Terraform modules simpler, while Terragrunt handles orchestration and environment configuration.

### 5. Environment-specific values are easier to manage

Values such as `application_version` are stored in per-environment `params.json` files.

This is often easier to maintain than putting conditional logic into Terraform based on `terraform.workspace`, especially once environments begin to diverge.

### 6. Better scalability for multiple environments

This pattern scales naturally from `dev` and `live` to additional environments such as `staging`, `test`, or multiple production regions.

With workspaces alone, teams often end up with increasingly complex conditional logic in a single Terraform configuration.

### 7. Lower operational risk

Running commands from a dedicated environment folder is more explicit than relying on the currently selected Terraform workspace.

That reduces the chance of planning or applying changes against the wrong environment.

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

`cd environments/dev && terragrunt plan`

Execute the plan:

`cd environments/dev && terragrunt apply`
