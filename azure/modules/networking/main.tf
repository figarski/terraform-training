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

#przyklad z count
resource "azurerm_resource_group" "rg_f" {
  count = var.rg_count
  name = "metadata-frg-${count.index}"
  location = var.location
}


#przyklad for_each nr 1 z variable
resource "azurerm_resource_group" "example-frg" {
  for_each = var.storage_accounts
  name = "terraform-training-${var.enviroment}-rg-${each.value}"
  location = var.location
}


#przyklad for_each nr 2 bez deklaracji variable, tylko w resource wartosci
resource "azurerm_resource_group" "example-frg2" {
  for_each = toset(["devstorageaccount", "prestorageaccount"])
  name = "terraform-training-${var.enviroment}-rg-${each.value}"
  location = var.location
}