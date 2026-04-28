variable "environment" {}

variable "application" {
  description = "The name of the application"
  type = string
}

variable "application_version" {
  description = "A version for the application module"
  type = string
}