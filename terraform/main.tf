module "application" {
  source = "./modules/application"
  environment = var.environment
  application_version = var.application_version
}