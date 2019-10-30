provider "kubernetes" {
  config_context_cluster   = "gke_${var.project_id}_${var.cluster_location}_${var.cluster_name}"
}
