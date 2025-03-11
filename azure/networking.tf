resource "azurerm_virtual_network" "virt_network" {
    name = "${random_pet.random_f.id}_vnet"
    address_space = ["10.0.0.0/16"]
    location = "eastus"
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
  address_prefixes = ["10.0.0.0/24"]
}

resource "azurerm_subnet" "subnet_f2" {
  name = "${random_pet.random_f.id}_subnet-1"
  resource_group_name = "terraform-training-${var.enviroment}-rg"
  virtual_network_name = azurerm_virtual_network.virt_network.name
  address_prefixes = ["10.0.1.0/24"]
}
