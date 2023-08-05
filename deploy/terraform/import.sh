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

import "keycloak_realm.apps_dev" "apps-dev"
import "keycloak_realm.apps_prod" "apps-prod"

plan
