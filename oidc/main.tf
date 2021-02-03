resource "vault_jwt_auth_backend" "oidc" {
  description = "Azure AD OIDC Authentication"

  path               = "oidc"
  type               = "oidc"
  oidc_discovery_url = var.oidc_discovery_url
  oidc_client_id     = var.oidc_client_id
  oidc_client_secret = var.oidc_client_secret
  default_role       = "default"
}

#Create a default role under the auth/oidc path
resource "vault_jwt_auth_backend_role" "default" {
  backend        = vault_jwt_auth_backend.oidc.path
  role_name      = "default"
  token_policies = ["default"]

  user_claim            = "name"
  oidc_scopes           = ["https://graph.microsoft.com/.default"]
  groups_claim          = "groups"
  allowed_redirect_uris = var.allowed_redirect_uris
}
