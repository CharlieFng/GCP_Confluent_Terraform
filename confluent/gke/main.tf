resource "google_container_cluster" "primary" {
  name               = "gke-confluent"
  location           = "australia-southeast1-a"
  initial_node_count = 6

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  node_config {

    preemptible  = true
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
    command = "gcloud container clusters get-credentials gke-confluent --zone australia-southeast1-a --project charlie-feng-contino"
  }

}


