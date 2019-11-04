provider "helm" {
  install_tiller = true
  service_account = "tiller"
  tiller_image = "gcr.io/kubernetes-helm/tiller:v2.9.0"
}
