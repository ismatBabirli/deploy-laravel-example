variable "DOCKER_IMG_TAG" {}
variable "APP_NAME" {}

locals {
    repository    = "https://index.docker.io/v1"
    service_image = "${local.repository}/${var.APP_NAME}:${var.DOCKER_IMG_TAG}"
}
