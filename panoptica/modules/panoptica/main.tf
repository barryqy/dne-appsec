// Main File
terraform {
  required_providers {
    securecn = {
      source = "Portshift/securecn"
      version = ">= 1.1.9"
    }
  }
}

################################################################################
# Create Panoptica Kubernetes Cluster Controller Resource
################################################################################
resource "securecn_k8s_cluster" "cluster" {
  kubernetes_cluster_context = var.kubernetes_cluster_context_name
  name = "${var.environment_name}_Cluster"
  orchestration_type = "KUBERNETES"
  ci_image_validation = false
  cd_pod_template = false
  connections_control = true
  multi_cluster_communication_support = false
  inspect_incoming_cluster_connections = false
  fail_close = false
  persistent_storage = false
}

################################################################################
# Create Panoptica Kubernetes Cluster Yelb App Environment
################################################################################
resource "securecn_environment" "yelb" {

  name = "${var.environment_name}_Yelb_App"
  description = "Yelb App Environment"

  kubernetes_environment {
    cluster_name = securecn_k8s_cluster.cluster.name

    namespaces_by_labels = {
      app = "yelb"
    }
  }
}