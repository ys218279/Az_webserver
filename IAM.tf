
# Define IAM role and assign user
resource "azurerm_role_assignment" "key_vault_user" {
  scope                = azurerm_key_vault.kv_infra_secrets.id
  role_definition_name = "Key Vault Administrator" #specify the perms you want for the IAM role
  principal_id         = var.object_id

}


