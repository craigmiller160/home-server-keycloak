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
    terms_and_conditions = {
      alias = "terms_and_conditions"
      name = "Terms and Conditions"
      enabled = false
      default_action = false
      priority = 3
    }
    update_profile = {
      alias = "UPDATE_PROFILE"
      name = "Update Profile"
      enabled = true
      default_action = true
      priority = 4
    }
    verify_email = {
      alias = "VERIFY_EMAIL"
      name = "Verify Email"
      enabled = true
      default_action = true
      priority = 5
    }
    delete_account = {
      alias = "delete_account"
      name = "Delete Account"
      enabled = false
      default_action = false
      priority = 6
    }
    webauthn_register = {
      alias = "webauthn-register"
      name = "Webauthn Register"
      enabled = false
      default_action = false
      priority = 7
    }
    webauthn_register_passwordless = {
      alias = "webauthn-register-passwordless"
      name = "Webauthn Register Passwordless"
      enabled = false
      default_action = false
      priority = 8
    }
    update_user_locale = {
      alias = "update_user_locale"
      name = "Update User Locale"
      enabled = false
      default_action = false
      priority = 9
    }
    verify_profile = {
      alias = "VERIFY_PROFILE"
      name = "Verify Profile"
      enabled = true
      default_action = true
      priority = 10
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