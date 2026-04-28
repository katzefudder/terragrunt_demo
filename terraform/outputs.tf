output "application_name" {
  value = var.application
}

output "environment" {
  value = var.environment
}

output "application_version" {
  value = module.application.application_version
}