resource "keycloak_realm" "apps_dev" {
  realm = "apps-dev"
  enabled = true
  display_name = "Apps (Dev)"
  display_name_html = '<div class="kc-logo-text"><span>Apps (Dev)</span></div>'
}