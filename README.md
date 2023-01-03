# Home Server KeyCloak

This is the Helm chart that deploys KeyCloak to the cluster.

## Pre-Requisites

1. Postgres
2. 1Password

A database called `keycloak` must exist in Postgres.

## Terraform Setup

Follow the instructions for setting up the client for terraform to use at this link: [KeyCloak Terraform Docs](https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs).

## Environment Variables

The following shell environment variables must be present on the machine in order to properly deploy this chart:

```
# The operator access token for communicating with 1Password
ONEPASSWORD_TOKEN=XXXXXXX
```