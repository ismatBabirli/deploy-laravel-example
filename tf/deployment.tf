resource "kubernetes_deployment" "laravel-deployment"  {
    metadata {
        name = var.APP_NAME
        namespace = "develop"

        labels = {
            app = var.APP_NAME
        }
    }
    spec {
        selector {
            match_labels = {
                app = var.APP_NAME
            }
        }

        template {
            metadata {
                name = var.APP_NAME
                namespace = "develop"

                labels = {
                    app = var.APP_NAME
                }
            }
            spec {
                container {
                    name  = var.APP_NAME
                    image = local.service_image

                    env {
                        name  = "PROFILE"
                        value = "production"
                    }
                }

                host_aliases {
                    hostnames = ["mlspp.integration.services"]
                    ip = "192.168.20.200"
                }

                image_pull_secrets {
                    name = "ismatbabir"
                }
            }
        }
        replicas = 1
    }
}
