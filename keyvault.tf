# Create Key vault resource 
resource "azurerm_key_vault" "kv_infra_secrets" {
  name                       = "kv-webserver-dev2"
  location                   = azurerm_resource_group.main.location
  resource_group_name        = azurerm_resource_group.main.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  purge_protection_enabled   = true
  soft_delete_retention_days = 7
  enable_rbac_authorization  = true
  tags                       = var.tags

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"

    ip_rules = var.kv_allowed_ip

  }
}

# Create Secrets to go in the KV

resource "azurerm_key_vault_secret" "ssh_key" {
  name         = "ssh-public-key"
  value        = file("/Users/yousen01/.ssh/id_rsa.pub")
  key_vault_id = azurerm_key_vault.kv_infra_secrets.id
}

resource "azurerm_key_vault_secret" "allowed_ssh_ip" {
  name         = "allowed-ssh-ip"
  value        = join(",", var.allowed_ssh_ip)
  key_vault_id = azurerm_key_vault.kv_infra_secrets.id
}