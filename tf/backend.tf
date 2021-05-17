terraform {
    backend "local" {
        path = "/var/tfstate/laravel-MS_NAME-test.tfstate"
    }
}

provider "kubernetes" {
    config_path = "~/configs/.kube/config"
    config_context = "kubernetes-admin@kubernetes"
}
