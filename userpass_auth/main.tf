resource "vault_generic_endpoint" "userpass_user" {
  path                 = "auth/userpass/users/${var.userpass_name}"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": "${var.userpass_policies}",
  "password": "${var.userpass_password}"
}
EOT
}
