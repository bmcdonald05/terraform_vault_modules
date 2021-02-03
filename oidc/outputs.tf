output "oidc_accessor" {
  value = vault_jwt_auth_backend.oidc.accessor
}

output "oidc_path" {
  value = vault_jwt_auth_backend.oidc.path
}
