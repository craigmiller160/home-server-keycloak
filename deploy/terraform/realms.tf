locals {
  common_realm_settings = {
    login = {
      registration_email_as_username = true
    }
  }
}

resource "keycloak_realm" "apps_dev" {
  realm = "apps-dev"
  enabled = true
  display_name = "Apps (Dev)"
  display_name_html = "<div class='kc-logo-text'><span>Apps (Dev)</span></div>"

  login = {
    registration_email_as_username = true
  }
}

resource "keycloak_realm" "apps_prod" {
  realm = "apps-prod"
  enabled = true
  display_name = "Apps (Prod)"
  display_name_html = "<div class='kc-logo-text'><span>Apps (Prod)</span></div>"
}