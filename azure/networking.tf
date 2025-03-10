resource "azurerm_virtual_network" "virt_network" {
  name = "peka_net"
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}