provider "google" {
  project = "charlie-feng-contino"
  region = "australia-southeast1"
  credentials = "${file("${var.credential_path}/credential.json")}"
}

