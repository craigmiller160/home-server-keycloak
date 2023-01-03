# Home Server KeyCloak

This is the Helm chart that deploys KeyCloak to the cluster.

## Pre-Requisites

1. Postgres
2. 1Password

A database called `keycloak` must exist in Postgres.

## Environment Variables

The following shell environment variables must be present on the machine in order to properly deploy this chart:

```
# The operator access token for communicating with 1Password
ONEPASSWORD_TOKEN=XXXXXXX
```