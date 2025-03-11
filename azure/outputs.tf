output "vnet_id" {
  value = azurerm_virtual_network.virt_network.name
  }

output "subnet_f_id1" {
  value = azurerm_subnet.subnet_f1.name
  }

output "subnet_f_id2" {
  value = azurerm_subnet.subnet_f2.name
  }