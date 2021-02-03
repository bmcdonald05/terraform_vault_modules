resource "vault_policy" "admins" {
  provider   = vault.devops_sandbox
  name = "admins"

  policy = <<EOT

# Manage auth methods broadly across Vault
path "auth/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create, update, and delete auth methods
path "sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}

# List auth methods
path "sys/auth"
{
  capabilities = ["read"]
}

# Create and manage ACL policies
path "sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# To list policies - Step 3
path "sys/policies/acl"
{
  capabilities = ["list"]
}

# Create and manage secrets engines broadly across Vault.
path "sys/mounts/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Read health checks
path "sys/health"
{
  capabilities = ["read", "sudo"]
}

# Check capabilities of a token
path "sys/capabilities"
{
  capabilities = ["create", "update"]
}

# Check capabilities of a token
path "sys/capabilities-self"
{
  capabilities = ["create", "update"]
}

EOT
}

resource "vault_policy" "provisioner" {
  provider   = vault.devops_sandbox
  name = "provisioner"

  policy = <<EOT

# Provisioner is a type of user or service that will be used by an automated tool (e.g. Terraform) to provision Vault resources.

# Manage auth methods broadly across Vault
path "auth/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create, update, and delete auth methods
path "sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}

# List auth methods
path "sys/auth"
{
  capabilities = ["read"]
}

# List existing policies
path "sys/policies/acl"
{
  capabilities = ["list"]
}

# Create and manage ACL policies via API & UI
path "sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

EOT
}

resource "vault_policy" "test1" {
  provider   = vault.devops_sandbox
  name = "test1"

  policy = <<EOT

# Sample path to secret
path "secret/secret1/foo/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

EOT
}
