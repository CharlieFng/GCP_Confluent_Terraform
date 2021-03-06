resource "google_container_cluster" "primary" {
  name               = "${var.cluster_name}"
  location           = "${var.cluster_location}"
  initial_node_count = 6

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  node_config {

    preemptible  = false
    machine_type = "n1-highmem-2"

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

  timeouts {
    create = "30m"
    update = "40m"
  }

  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${var.cluster_name} --zone ${var.cluster_location} --project ${var.project_id}"
  }

}


