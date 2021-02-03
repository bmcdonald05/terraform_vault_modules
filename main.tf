### Example code to test modules ###

terraform {
  required_version = ">= 0.13"

}

terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~>2.18"
    }
  }
}

provider "vault" {
  address         = var.vault_cluster_addr
  skip_tls_verify = true #if TLS has not been setup

}

### Deploy to a dedicated test namespace
resource "vault_namespace" "devops_sandbox" {
  path = "devops_sandbox"
}

provider "vault" {
  alias     = "devops_sandbox"
  namespace = vault_namespace.devops_sandbox.path
}
###

resource "vault_auth_backend" "userpass" {
  provider   = vault.devops_sandbox
  depends_on = [vault_namespace.devops_sandbox]

  type = "userpass"
}

module "userpass_user1" {
  source     = "./userpass_auth"
  providers = {
    vault = vault.devops_sandbox
  }
  depends_on = [vault_namespace.devops_sandbox]

  userpass_name     = var.userpass_name_1
  userpass_password = var.userpass_password_1
  userpass_policies = var.userpass_policies_1
  ### OR ##
  # userpass_policies = ["admins", "test1"]
}
