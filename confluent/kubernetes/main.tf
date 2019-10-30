resource "kubernetes_service_account" "tiller" {
  metadata {
    name = "tiller"
    namespace = "kube-system"
  }
}

resource "kubernetes_cluster_role_binding" "tiller" {
  metadata {
    name = "tiller"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "tiller"
    namespace = "kube-system"
  }
}

resource "kubernetes_namespace" "operator" {
  metadata {
    name = "operator"
  }

  provisioner "local-exec" {
    command = "kubectl -n operator patch serviceaccount default -p '{\"imagePullSecrets\": [{\"name\": \"confluent-docker-registry\" }]}'"
  }  
}

 #resource "kubernetes_service_account" "default" {
 # metadata {
 #   name = "default"
 #   namespace = "operator"
 # }
 # image_pull_secret {
 #    name = "confluent-docker-registry" 
 # }
 #}

 ## terraform import kubernetes_service_account.default operator/default

