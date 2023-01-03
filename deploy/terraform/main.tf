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

output "my_onepassword_item" {
  value = data.onepassword_item.terraform_client
  sensitive = true
}

#provider "keycloak" {
#  client_id = data.onepassword_item.terraform_client.section.keycloak.clientId
#  client_secret = data.onepassword_item.terraform_client.clientSecret
#  url = "https://auth-craigmiller160.ddns.net"
#}

provider "onepassword" {
  url = "https://infra-craigmiller160.ddns.net/onepassword"
  token = var.onepassword_token
}