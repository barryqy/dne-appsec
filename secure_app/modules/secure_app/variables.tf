variable "appd_accessKey" {
  description = "AppD Access Key (can be found at Settings > License > Account Details > Access Key"
  type = string
  sensitive = true
}
variable "appd_cluster_name" {
  description = "Name of the Kubernetes cluster"
}
variable "appd_url" {
  description = "URL of the Appd SaaS instance ex: https://mycompany.saas.appdynamics.com"
}
variable "appd_account_name" {
  description = "Name of the AppD Account (can be found at Settings > License > Account Details > Name"
}
variable "appd_namespaces" {
  description = "Namespaces AppD will be monitoring"
}