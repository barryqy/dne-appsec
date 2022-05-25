// Providers
terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.4.1"
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


// Deploy Secure Application (AppD)
module "Secure_App" {
  source = "./modules/secure_app"
  appd_cluster_name = var.appd_cluster_name
  appd_url          = var.appd_url
  appd_account_name = var.appd_account_name
  appd_accessKey    = var.appd_accessKey
  appd_namespaces   = var.appd_namespaces
}