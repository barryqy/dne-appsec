// AppD deployment of Kubernetes Metrics Server, AppD Namespace, AppD Cluster Agent Operator, Secret Key, and Cluster
// Agent


// Deploy Metrics Server to kube-system namespace
resource "null_resource" "metrics-server" {
  provisioner "local-exec" {
      working_dir = path.module
      command = "kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml"
  }
}
// Create appdynamics namespace
resource "kubernetes_namespace" "appdynamics" {
  depends_on = [null_resource.metrics-server]
  metadata {
    name = "appdynamics"
  }
}
// Deploy cluster-agent-operator
resource "null_resource" "cluster-agent-operator" {
  depends_on = [kubernetes_namespace.appdynamics]
  provisioner "local-exec" {
      working_dir = path.module
      command = "kubectl create -f cluster-agent-operator.yaml"
  }
}

// Create Secret using Account Key
resource "kubernetes_secret" "cluster-agent-secret" {
  depends_on = [kubernetes_namespace.appdynamics]
  metadata {
    name = "cluster-agent-secret"
    namespace = "appdynamics"
  }
  data = {
    controller-key = var.appd_accessKey
  }
}

// Deploy Cluster Agent Config
resource "kubectl_manifest" "cluster-agent" {
  depends_on = [kubernetes_secret.cluster-agent-secret]
  yaml_body = <<YAML
apiVersion: cluster.appdynamics.com/v1alpha1
kind: Clusteragent
metadata:
  name: k8s-cluster-agent
  namespace: appdynamics
spec:
  appName: "${var.appd_cluster_name}"
  controllerUrl: "${var.appd_url}"
  account: "${var.appd_account_name}"
  # docker image info
  image: "docker.io/appdynamics/cluster-agent:latest"
  serviceAccountName: appdynamics-cluster-agent
  #
  # auto-instrumentation config
  #
  instrumentationMethod: Env
  nsToInstrumentRegex: ${var.appd_namespaces}
  appNameStrategy: namespace
  instrumentationRules:
    - namespaceRegex: ${var.appd_namespaces}
      language: java
      labelMatch:
        - framework: java
      imageInfo:
        image: "docker.io/appdynamics/java-agent:latest"
        agentMountPath: /opt/appdynamics
        imagePullPolicy: "IfNotPresent"
YAML
}
