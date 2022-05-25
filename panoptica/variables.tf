// Variables File

// Panoptica Variables
#variable "panoptica_access_key" {
#  description = "Panoptica Access Key"
#  type        = string
#  sensitive   = true
#}
#variable "panoptica_secret_key" {
#  description = "Panoptica Secret Key"
#  type        = string
#  sensitive   = true
#}
#variable "environment_name" {
#  description = "Name assigned to the environment"
#  type        = string
#  default     = "AppSec"
#}
#// Run "kubectl config current-context"
#variable "kubernetes_cluster_context_name" {
#  description = "Name of the Kubernetes cluster context used to connect to the API"
#  type        = string
#  default     = "kind"
#}

// AppDynamics Secure App Variables
#variable "appd_url" {
#  description = "AppDynamics controller URL"
#  type        = string
#  sensitive   = true
#}
#
#variable "appd_account" {
#  description = "AppDynamics controller account name"
#  type        = string
#  sensitive   = true
#}
#
#variable "appd_username" {
#  description = "AppDynamics controller username"
#  type        = string
#  sensitive   = true
#}
#
#variable "appd_password" {
#  description = "AppDynamics controller password"
#  type        = string
#  sensitive   = true
#}
#
#variable "appd_accessKey" {
#  description = "AppDynamics controller access key"
#  type        = string
#  sensitive   = true
#}
#variable "appd_namespaces" {
#  description = "Namespaces to install java agent (ex: sock-shop, or for multiple ns, sock-shop|yelb|book)"
#}
