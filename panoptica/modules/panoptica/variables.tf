// Panoptica Variables
variable "environment_name" {
  description = "Name assigned to the environment"
  type        = string
  default     = "AppSec"
}
// Run "kubectl config current-context"
variable "kubernetes_cluster_context_name" {
  description = "Name of the Kubernetes cluster context used to connect to the API"
  type        = string
  default     = "kind"
}