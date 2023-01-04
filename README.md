# Home Server KeyCloak

This is the Helm chart that deploys KeyCloak to the cluster.

## Pre-Requisites

1. Postgres
2. 1Password

A database called `keycloak` must exist in Postgres.

## Terraform Setup

Follow the instructions for setting up the client for terraform to use at this link: [KeyCloak Terraform Docs](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs).

Then, get the ID of the master admin user and import it into terraform by running the following commands:

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