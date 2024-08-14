module "dummy_module" {
  source = "./modules/dummy_module"
  environment = var.environment
  counter = var.counter
}