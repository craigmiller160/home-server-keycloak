#!/bin/sh

function import {
  terraform \
    import \
    -var="onepassword_token=$ONEPASSWORD_TOKEN"\
    "$1" "$2"
}

function plan {
  terraform plan \
    -var "onepassword_token=$ONEPASSWORD_TOKEN"
}

function init {
  terraform init \
    -reconfigure \
    -var "onepassword_token=$ONEPASSWORD_TOKEN"
}

import "keycloak_realm.master" "master"
import "keycloak_realm.apps_dev" "apps-dev"
import "keycloak_realm.apps_prod" "apps-prod"
import "keycloak_openid_client.postman_dev" "apps-dev/b73f2dcc-7181-40af-bd96-cd5f5ee50b13"
import "keycloak_openid_client.postman_prod" "apps-prod/74bcbdc4-f5a3-4ea3-ad20-0971225105ae"
import "keycloak_user.master_admin_user" "master/e68031b4-b2e0-4505-b990-567d8815cbea"
import "keycloak_required_action.dev_configure_otp" "apps-dev/"
import "keycloak_required_action.prod_configure_otp" "apps-prod/"
import "keycloak_required_action.dev_update_password" "apps-dev/"
import "keycloak_required_action.prod_update_password" "apps-prod/"
import "keycloak_required_action.dev_terms_and_conditions" "apps-dev/"
import "keycloak_required_action.prod_terms_and_conditions" "apps-prod/"
import "keycloak_required_action.dev_update_profile" "apps-dev/"
import "keycloak_required_action.prod_update_profile" "apps-prod/"
import "keycloak_required_action.dev_verify_email" "apps-dev/"
import "keycloak_required_action.prod_verify_email" "apps-prod/"
import "keycloak_required_action.dev_delete_account" "apps-dev/"
import "keycloak_required_action.prod_delete_account" "apps-prod/"
import "keycloak_required_action.dev_webauthn_register" "apps-dev/"
import "keycloak_required_action.prod_webauthn_register" "apps-prod/"
import "keycloak_required_action.dev_webauthn_register_passwordless" "apps-dev/"
import "keycloak_required_action.prod_webauthn_register_passwordless" "apps-prod/"
import "keycloak_required_action.dev_update_user_locale" "apps-dev/"
import "keycloak_required_action.prod_update_user_locale" "apps-prod/"
import "keycloak_required_action.dev_verify_profile" "apps-dev/"
import "keycloak_required_action.prod_verify_profile" "apps-prod/"

plan
