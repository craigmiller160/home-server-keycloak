resource "keycloak_required_action" "required_action" {
  realm_id = keycloak_realm.apps_prod.id
  alias    = "UPDATE_PASSWORD"
  enabled  = true
  name     = "Update Password"
  default_action = true
  priority = 2
}

#  Error: validation error: required action "update-password" does not exist on the server, installed providers: [terms_and_conditions update_user_locale delete_account webauthn-register-passwordless VERIFY_PROFILE UPDATE_PASSWORD CONFIGURE_TOTP VERIFY_EMAIL webauthn-register UPDATE_PROFILE]
