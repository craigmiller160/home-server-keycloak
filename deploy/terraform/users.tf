resource "keycloak_user" "master_admin_user" {
  realm_id = keycloak_realm.master.id
  username = local.keycloak_admin.username
  enabled = true
  email = local.keycloak_admin.username
  first_name = local.keycloak_admin.first_name
  last_name = local.keycloak_admin.last_name
  email_verified = true
}