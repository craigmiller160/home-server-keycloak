terraform {
  backend "kubernetes" {
    secret_suffix = "keycloak-state"
    config_path   = "~/.kube/config"
  }

  required_providers {
    keycloak = {
      source = "mrparkers/keycloak"
      version = "4.1.0"
    }

    onepassword = {
      source = "1Password/onepassword"
      version = "1.1.4"
    }
  }
}

provider "keycloak" {
  client_id = "terraform-client"
  client_secret = var.terraform_client_secret
  url = "https://auth-craigmiller160.ddns.net"
}

provider "onepassword" {
  url = "https://infra-craigmiller160.ddns.net/onepassword"
  token = var.onepassword_token
}