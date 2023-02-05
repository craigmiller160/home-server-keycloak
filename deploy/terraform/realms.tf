locals {
  common_realm_settings = {
    ssl_required = "all"
    login = {
      verify_email = true
      reset_password_allowed = true
      registration_email_as_username = true
      login_with_email_allowed = true
      theme = "keycloak"
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

    timeouts = {
      sso_session_idle = "30m"
      sso_session_max = "10h"
      offline_session_idle = "30d"
      login = "30m"
      login_action = "30m"
      access_token = "5m"
      user_action = "5m"
      admin_action = "12h"
    }

    refresh_token = {
      revoke = true
      max_reuse = 1
    }
  }
}

resource "keycloak_realm" "master" {
  realm = "master"
  enabled = true
  display_name = "Keycloak"
  display_name_html = "<div class='kc-logo-text'><span>Keycloak</span></div>"
  ssl_required = "all"
  default_signature_algorithm = "ES256"
  login_theme = "keycloak"
}

resource "keycloak_realm" "apps_dev" {
  realm = "apps-dev"
  enabled = true
  display_name = "Craig Miller's Apps (Dev)"
  display_name_html = "<h1>Craig Miller's Apps (Dev)</h1>"
  ssl_required = local.common_realm_settings.ssl_required

  verify_email = local.common_realm_settings.login.verify_email
  reset_password_allowed = local.common_realm_settings.login.reset_password_allowed
  registration_email_as_username = local.common_realm_settings.login.registration_email_as_username
  login_with_email_allowed = local.common_realm_settings.login.login_with_email_allowed
  # No policy in dev
  password_policy = ""
  login_theme = local.common_realm_settings.login.theme

  sso_session_idle_timeout = local.common_realm_settings.timeouts.sso_session_idle
  sso_session_max_lifespan = local.common_realm_settings.timeouts.sso_session_max
  offline_session_idle_timeout = local.common_realm_settings.timeouts.sso_session_idle
  access_code_lifespan_login = local.common_realm_settings.timeouts.login
  access_code_lifespan_user_action = local.common_realm_settings.timeouts.login_action
  access_token_lifespan = local.common_realm_settings.timeouts.access_token
  action_token_generated_by_user_lifespan = local.common_realm_settings.timeouts.user_action
  action_token_generated_by_admin_lifespan = local.common_realm_settings.timeouts.admin_action

  revoke_refresh_token = local.common_realm_settings.refresh_token.revoke
  refresh_token_max_reuse = local.common_realm_settings.refresh_token.max_reuse

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
  display_name = "Craig Miller's Apps"
  display_name_html = "<h1>Craig Miller's Apps</h1>"
  ssl_required = local.common_realm_settings.ssl_required

  verify_email = local.common_realm_settings.login.verify_email
  reset_password_allowed = local.common_realm_settings.login.reset_password_allowed
  registration_email_as_username = local.common_realm_settings.login.registration_email_as_username
  login_with_email_allowed = local.common_realm_settings.login.login_with_email_allowed
  password_policy = "length(8) and upperCase(1) and lowerCase(1) and digits(1) and passwordHistory(3) and notUsername and specialChars(1) and notEmail"
  login_theme = local.common_realm_settings.login.theme

  sso_session_idle_timeout = local.common_realm_settings.timeouts.sso_session_idle
  sso_session_max_lifespan = local.common_realm_settings.timeouts.sso_session_max
  offline_session_idle_timeout = local.common_realm_settings.timeouts.sso_session_idle
  access_code_lifespan_login = local.common_realm_settings.timeouts.login
  access_code_lifespan_user_action = local.common_realm_settings.timeouts.login_action
  access_token_lifespan = local.common_realm_settings.timeouts.access_token
  action_token_generated_by_user_lifespan = local.common_realm_settings.timeouts.user_action
  action_token_generated_by_admin_lifespan = local.common_realm_settings.timeouts.admin_action

  revoke_refresh_token = local.common_realm_settings.refresh_token.revoke
  refresh_token_max_reuse = local.common_realm_settings.refresh_token.max_reuse

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