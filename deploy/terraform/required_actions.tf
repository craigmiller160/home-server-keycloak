resource "keycloak_required_action" "required_action" {
  realm_id = keycloak_realm.apps_prod.id
  alias    = "update-password"
  enabled  = true
  name     = "Update Password"
  default_action = true
}