locals {
  client_common = {
    client_id = "postman"
    name = "postman"
    enabled = true
    access_type = "CONFIDENTIAL"
    service_accounts_enabled = true
    direct_access_grants_enabled = true
  }
}

resource "keycloak_openid_client" "postman_dev" {
  realm_id = keycloak_realm.apps_dev.id
  client_id = local.client_common.client_id
  name = local.client_common.name
  enabled = local.client_common.enabled
  access_type = local.client_common.access_type
  service_accounts_enabled = local.client_common.service_accounts_enabled
  direct_access_grants_enabled = local.client_common.direct_access_grants_enabled
  web_origins = [
    "*"
  ]
}

resource "keycloak_openid_client" "postman_prod" {
  realm_id = keycloak_realm.apps_prod.id
  client_id = local.client_common.client_id
  name = local.client_common.name
  enabled = local.client_common.enabled
  access_type = local.client_common.access_type
  service_accounts_enabled = local.client_common.service_accounts_enabled
  direct_access_grants_enabled = local.client_common.direct_access_grants_enabled
  web_origins = [
    "*"
  ]
}