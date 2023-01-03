locals {
  common_realm_settings = {
    login = {
      verify_email = true
      reset_password_allowed = true
      ssl_required = true
    }
  }
}

resource "keycloak_realm" "apps_dev" {
  realm = "apps-dev"
  enabled = true
  display_name = "Apps (Dev)"
  display_name_html = "<div class='kc-logo-text'><span>Apps (Dev)</span></div>"

  verify_email = local.common_realm_settings.login.verify_email
  reset_password_allowed = local.common_realm_settings.login.reset_password_allowed
  ssl_required = local.common_realm_settings.login.ssl_required
}

resource "keycloak_realm" "apps_prod" {
  realm = "apps-prod"
  enabled = true
  display_name = "Apps (Prod)"
  display_name_html = "<div class='kc-logo-text'><span>Apps (Prod)</span></div>"

  verify_email = local.common_realm_settings.login.verify_email
  reset_password_allowed = local.common_realm_settings.login.reset_password_allowed
  ssl_required = local.common_realm_settings.login.ssl_required
}