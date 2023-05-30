#######################################
# Providers
#######################################

terraform {
  required_providers {
    securecn = {
      source = "Portshift/securecn"
      version = ">= 1.1.9"
    }
  }
}

provider "securecn" {
  access_key = var.panoptica_access_key
  secret_key = var.panoptica_secret_key
}
