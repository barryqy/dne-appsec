// Providers
terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.4.1"
    }
    securecn = {
      source = "Portshift/securecn"
      version = ">= 1.1.9"
    }
    kubectl = {
      source = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = ">= 2.2.0"
    }
  }
}
provider "kubernetes" {
  config_path = "~/.kube/config"
}
provider "kubectl" {
  config_path = "~/.kube/config"
}
provider "securecn" {
  access_key = var.panoptica_access_key
  secret_key = var.panoptica_secret_key
}

// Modules
