data "azurerm_client_config" "current" {
}

resource "azurerm_key_vault" "vault" {
  name                = "klkeyvault"
  location            = var.location
  resource_group_name = "terraform-training-${var.enviroment}-rg"
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
}

resource "azurerm_key_vault_access_policy" "vaultpolicy" {
  key_vault_id = azurerm_key_vault.vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions = [
    "Get",
  ]

  secret_permissions = [
    "Get","List","Set"
  ]
}

# ephemeral "azurerm_key_vault_secret" "secret" {
#   name         = "secret-sauce"
#   key_vault_id = data.azurerm_key_vault.vault.id
# }