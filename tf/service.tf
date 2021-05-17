resource "kubernetes_service" "laravel-service" {
    metadata {
        name = var.APP_NAME
        namespace = "develop"

        labels = {
            app = var.APP_NAME
        }
    }
    spec {
        selector = {
            app = var.APP_NAME
        }

        type = "NodePort"

        port {
            name        = "http"
            port        = 80
            target_port = 9000
        }
    }
}
