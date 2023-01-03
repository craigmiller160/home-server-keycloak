data "onepassword_item" "terraform_client" {
  vault = "k6xneqw7nf5f2fm4azxhbdrcji"
  uuid = "2tkhev4w3khzz5q6uf3otwtl6u"
}

data "onepassword_item" "email_credentials" {
  vault = "k6xneqw7nf5f2fm4azxhbdrcji"
  uuid = "kh5bwbxzwc4h5a5wa2ndo543vy"
}

locals {
  terraform_client = {
    client_id = data.onepassword_item.terraform_client.section[0].field[0].value
    client_secret = data.onepassword_item.terraform_client.section[0].field[1].value
  }
  email_credentials = {
    username = data.onepassword_item.email_credentials.username
    password = data.onepassword_item.email_credentials.password
    host = data.onepassword_item.email_credentials.section[0].field[0].value
    port = data.onepassword_item.email_credentials.section[0].field[1].value
    start_tls = data.onepassword_item.email_credentials.section[1].field[1].value
    ssl = data.onepassword_item.email_credentials.section[1].field[2].value
  }
}