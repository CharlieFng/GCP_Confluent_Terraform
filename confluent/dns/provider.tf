provider "google" {
  project = "charlie-feng-contino"
  region = "australia-southeast1"
  credentials = "${file("${var.credential_path}/credential.json")}"
}

provider "kubernetes" {
  config_context_cluster   = "gke_${var.project_id}_${var.cluster_location}_${var.cluster_name}"
}
