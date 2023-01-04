locals {
  required_actions = {
    configure_otp = {
      alias = "CONFIGURE_TOTP"
      name = "Configure OTP"
      enabled = true
      default_action = false
      priority = 1
    }
    update_password = {
      alias = "UPDATE_PASSWORD"
      name = "Update Password"
      enabled = true
      default_action = true
      priority = 2
    }
  }
}

resource "keycloak_required_action" "dev_configure_otp" {
  realm_id = keycloak_realm.apps_dev.id
  alias = local.required_actions.configure_otp.alias
  name = local.required_actions.configure_otp.name
  enabled = local.required_actions.configure_otp.enabled
  default_action = local.required_actions.configure_otp.default_action
  priority = local.required_actions.configure_otp.priority
}

resource "keycloak_required_action" "prod_configure_otp" {
  realm_id = keycloak_realm.apps_prod.id
  alias = local.required_actions.configure_otp.alias
  name = local.required_actions.configure_otp.name
  enabled = local.required_actions.configure_otp.enabled
  default_action = local.required_actions.configure_otp.default_action
  priority = local.required_actions.configure_otp.priority
}

resource "keycloak_required_action" "dev_update_password" {
  realm_id = keycloak_realm.apps_dev.id
  alias = local.required_actions.update_password.alias
  name = local.required_actions.update_password.name
  enabled = local.required_actions.update_password.enabled
  default_action = local.required_actions.update_password.default_action
  priority = local.required_actions.update_password.priority
}

resource "keycloak_required_action" "prod_update_password" {
  realm_id = keycloak_realm.apps_prod.id
  alias = local.required_actions.update_password.alias
  name = local.required_actions.update_password.name
  enabled = local.required_actions.update_password.enabled
  default_action = local.required_actions.update_password.default_action
  priority = local.required_actions.update_password.priority
}

# [terms_and_conditions update_user_locale delete_account webauthn-register-passwordless VERIFY_PROFILE UPDATE_PASSWORD CONFIGURE_TOTP VERIFY_EMAIL webauthn-register UPDATE_PROFILE]
