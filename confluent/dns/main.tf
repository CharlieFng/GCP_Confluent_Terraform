data "kubernetes_service" "kafka-0-lb" {
    metadata {
        name = "kafka-0-lb"
        namespace = "operator"
    }
}

data "kubernetes_service" "kafka-1-lb" {
    metadata {
        name = "kafka-1-lb"
        namespace = "operator"
    }
}

data "kubernetes_service" "kafka-2-lb" {
    metadata {
        name = "kafka-2-lb"
        namespace = "operator"
    }
}

data "kubernetes_service" "kafka-bootstrap-lb" {
    metadata {
        name = "kafka-bootstrap-lb"
        namespace = "operator"
    }
}

data "kubernetes_service" "schemaregistry-bootstrap-lb" {
    metadata {
        name = "schemaregistry-bootstrap-lb"
        namespace = "operator"
    }
}

data "kubernetes_service" "controlcenter-bootstrap-lb" {
    metadata {
        name = "controlcenter-bootstrap-lb"
        namespace = "operator"
    }
}

resource "google_dns_record_set" "kafka-0-lb-A" {
    project      = "${var.project_id}"
    name         = "b0.${var.domain}"
    managed_zone = "${var.managed_zone}"
    type         = "A"
    ttl          = 300

    rrdatas = ["${data.kubernetes_service.kafka-0-lb.load_balancer_ingress.0.ip}"]
}

resource "google_dns_record_set" "kafka-1-lb-A" {
    project      = "${var.project_id}"
    name         = "b1.${var.domain}"
    managed_zone = "${var.managed_zone}"
    type         = "A"
    ttl          = 300

    rrdatas = ["${data.kubernetes_service.kafka-1-lb.load_balancer_ingress.0.ip}"]
}

resource "google_dns_record_set" "kafka-2-lb-A" {
    project      = "${var.project_id}"
    name         = "b2.${var.domain}"
    managed_zone = "${var.managed_zone}"
    type         = "A"
    ttl          = 300

    rrdatas = ["${data.kubernetes_service.kafka-2-lb.load_balancer_ingress.0.ip}"]
}

resource "google_dns_record_set" "kafka-bootstrap-lb" {
    project      = "${var.project_id}"
    name         = "kafka.${var.domain}"
    managed_zone = "${var.managed_zone}"
    type         = "A"
    ttl          = 300

    rrdatas = ["${data.kubernetes_service.kafka-bootstrap-lb.load_balancer_ingress.0.ip}"]
}

resource "google_dns_record_set" "schemaregistry-bootstrap-lb" {
    project      = "${var.project_id}"
    name         = "schemaregistry.${var.domain}"
    managed_zone = "${var.managed_zone}"
    type         = "A"
    ttl          = 300

    rrdatas = ["${data.kubernetes_service.schemaregistry-bootstrap-lb.load_balancer_ingress.0.ip}"]
}

resource "google_dns_record_set" "controlcenter-bootstrap-lb" {
    project      = "${var.project_id}"
    name         = "controlcenter.${var.domain}"
    managed_zone = "${var.managed_zone}"
    type         = "A"
    ttl          = 300

    rrdatas = ["${data.kubernetes_service.controlcenter-bootstrap-lb.load_balancer_ingress.0.ip}"]
}

output "kafka-lb-ip" {
    value = "${data.kubernetes_service.kafka-bootstrap-lb.load_balancer_ingress.0.ip}"
}

output "schemaregistry-lb-ip" {
    value = "${data.kubernetes_service.schemaregistry-bootstrap-lb.load_balancer_ingress.0.ip}"
}

output "controlcenter-lb-ip" {
    value = "${data.kubernetes_service.controlcenter-bootstrap-lb.load_balancer_ingress.0.ip}"
}
