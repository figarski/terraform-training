resource "azurerm_virtual_network" "virt_network" {
    name = "${random_pet.random_f.id}_vnet"
    address_space = var.address_space
    location = var.location
    resource_group_name = "terraform-training-${var.enviroment}-rg"
}

resource "random_pet" "random_f" {
   prefix = "pekao"
  length = 1
}

resource "azurerm_subnet" "subnet_f1" {
  name = "${random_pet.random_f.id}_subnet-0"
  resource_group_name = "terraform-training-${var.enviroment}-rg"
  virtual_network_name = azurerm_virtual_network.virt_network.name
  address_prefixes = [var.address_prefixes[0]]
}

resource "azurerm_subnet" "subnet_f2" {
  name = "${random_pet.random_f.id}_subnet-1"
  resource_group_name = "terraform-training-${var.enviroment}-rg"
  virtual_network_name = azurerm_virtual_network.virt_network.name
  address_prefixes = [var.address_prefixes[1]]
}
