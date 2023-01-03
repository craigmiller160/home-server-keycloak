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
  client_id = data.onepassword_item.terraform_client.section[0].field[0].value
  client_secret = data.onepassword_item.terraform_client.section[0].field[1].value
  url = "https://auth-craigmiller160.ddns.net"
}

provider "onepassword" {
  url = "https://infra-craigmiller160.ddns.net/onepassword"
  token = var.onepassword_token
}