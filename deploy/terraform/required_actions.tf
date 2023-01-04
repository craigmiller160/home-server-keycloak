resource "keycloak_required_action" "required_action" {
  realm_id = keycloak_realm.apps_prod.id
  alias    = "UPDATE_PASSWORD"
  enabled  = true
  name     = "Update Password"
  default_action = true
}