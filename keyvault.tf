resource "azurerm_key_vault" "webserver" {
  name                       = "kv-webserver-dev2"
  location                   = azurerm_resource_group.main.location
  resource_group_name        = azurerm_resource_group.main.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  purge_protection_enabled   = true
  soft_delete_retention_days = 7
  enable_rbac_authorization  = false
  tags                       = var.tags

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.object_id

    secret_permissions = [
    "Get", "Set", "Delete", "List"
    ]
  }


  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"

    ip_rules = var.kv_allowed_ip

  }
}

resource "azurerm_key_vault_secret" "ssh_key" {
  name         = "ssh-public-key"
  value        = file("/Users/yousen01/.ssh/id_rsa.pub")
  key_vault_id = azurerm_key_vault.webserver.id
}

resource "azurerm_key_vault_secret" "allowed_ssh_ip" {
  name         = "allowed-ssh-ip"
  value        = join(",", var.allowed_ssh_ip)
  key_vault_id = azurerm_key_vault.webserver.id
}