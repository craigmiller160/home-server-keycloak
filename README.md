# Home Server KeyCloak

This is the Helm chart that deploys KeyCloak to the cluster.

## Pre-Requisites

1. Postgres
2. 1Password

A database called `keycloak` must exist in Postgres.

## Terraform Setup

Follow the instructions for setting up the client for terraform to use at this link: [KeyCloak Terraform Docs](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs).

### Import Master Realm

Import the master realm with this command:

```bash
cd ./deploy/terraform
terraform import \
  -var=onepassword_token=$ONEPASSWORD_TOKEN \
  keycloak_realm.master \
  master
```

### Import Admin User

Get the ID of the admin user from the URL in the Keycloak UI and run this command with it:

```bash
cd ./deploy/terraform
terraform import \
  -var=onepassword_token=$ONEPASSWORD_TOKEN \
  keycloak_user.master_admin_user \
  master/e68031b4-b2e0-4505-b990-567d8815cbea
```

## Environment Variables

The following shell environment variables must be present on the machine in order to properly deploy this chart:

```
# The operator access token for communicating with 1Password
ONEPASSWORD_TOKEN=XXXXXXX
```