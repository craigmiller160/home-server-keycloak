locals {
  common_realm_settings = {
    ssl_required = 'all'
    login = {
      verify_email = true
      reset_password_allowed = true
      registration_email_as_username = true
      login_with_email_allowed = true
    }

    email = {
      host = local.email_credentials.host
      port = local.email_credentials.port
      from = local.email_credentials.username
      from_display_name = "Craig's Authorization Server"
      starttls = local.email_credentials.start_tls
      ssl = local.email_credentials.ssl
      username = local.email_credentials.username
      password = local.email_credentials.password
    }
  }
}

data "keycloak_realm" "master_realm" {
  realm = "master"
}

resource "keycloak_realm" "apps_dev" {
  realm = "apps-dev"
  enabled = true
  display_name = "Apps (Dev)"
  display_name_html = "<div class='kc-logo-text'><span>Apps (Dev)</span></div>"
  ssl_required = local.common_realm_settings.ssl_required

  verify_email = local.common_realm_settings.login.verify_email
  reset_password_allowed = local.common_realm_settings.login.reset_password_allowed
  registration_email_as_username = local.common_realm_settings.login.registration_email_as_username
  login_with_email_allowed = local.common_realm_settings.login.login_with_email_allowed
  # No policy in dev
  password_policy = ""

  smtp_server {
    host = local.common_realm_settings.email.host
    port = local.common_realm_settings.email.port
    from = local.common_realm_settings.email.from
    from_display_name = local.common_realm_settings.email.from_display_name
    starttls = local.common_realm_settings.email.starttls
    ssl = local.common_realm_settings.email.ssl
    auth {
      username = local.common_realm_settings.email.username
      password = local.common_realm_settings.email.password
    }
  }
}

resource "keycloak_realm" "apps_prod" {
  realm = "apps-prod"
  enabled = true
  display_name = "Apps (Prod)"
  display_name_html = "<div class='kc-logo-text'><span>Apps (Prod)</span></div>"
  ssl_required = local.common_realm_settings.ssl_required

  verify_email = local.common_realm_settings.login.verify_email
  reset_password_allowed = local.common_realm_settings.login.reset_password_allowed
  registration_email_as_username = local.common_realm_settings.login.registration_email_as_username
  login_with_email_allowed = local.common_realm_settings.login.login_with_email_allowed
  password_policy = "length(8) and upperCase(1) and lowerCase(1) and digits(1) and passwordHistory(3) and notUsername and specialChars(1) and notEmail"

  smtp_server {
    host = local.common_realm_settings.email.host
    port = local.common_realm_settings.email.port
    from = local.common_realm_settings.email.from
    from_display_name = local.common_realm_settings.email.from_display_name
    starttls = local.common_realm_settings.email.starttls
    ssl = local.common_realm_settings.email.ssl
    auth {
      username = local.common_realm_settings.email.username
      password = local.common_realm_settings.email.password
    }
  }
}