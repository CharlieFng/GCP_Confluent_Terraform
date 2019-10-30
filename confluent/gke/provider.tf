variable "path" {
  default = "/home/charlie_feng/terraform/credentials"
}


provider "google" {
  project = "charlie-feng-contino"
  region = "australia-southeast1"
  credentials = "${file("${var.path}/credential.json")}"
}

