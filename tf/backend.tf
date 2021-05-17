terraform {
    backend "local" {
        path = "/var/tfstate/laravel-MS_NAME-test.tfstate"
    }
}

provider "kubernetes" {
    load_config_file = true
    config_path = "~/.kube/config"
    config_context = "kubernetes-admin@kubernetes"
}
