terraform {
  required_providers {
    flexibleengine = {
      source  = "FlexibleEngineCloud/flexibleengine"
      version = "1.46.0"
    }
  }
}
provider "flexibleengine" {
  domain_name = var.domain
  user_name   = var.username
  password    = var.password
  region      = var.region
}