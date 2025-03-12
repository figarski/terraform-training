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

# resource "azurerm_subnet" "f_subnets" {
#   for_each = tomap({
#     subnet1       = "10.0.0.0/24"
#     subnet2       = "10.0.1.0/24"
#   })
#   name     = "${random_pet.random_f.id}_subnet-3"
#   virtual_network_name = azurerm_virtual_network.virt_network.name
#   address_prefixes = each.value
#   resource_group_name = "terraform-training-${var.enviroment}-rg"
# }

#przyklad for_each z locals
resource "azurerm_subnet" "f_subnets" {
  for_each = local.subnets
  address_prefixes = each.value.address_prefixes
  name = "${random_pet.random_f.id}-${each.key}"
  resource_group_name = "terraform-training-${var.enviroment}-rg"
  virtual_network_name = azurerm_virtual_network.virt_network.name
}

#przyklad for_each z variables
resource "azurerm_subnet" "subnet_f1_x" {
  for_each = var.addresses
  name = "${random_pet.random_f.id}_${each.key}"
  resource_group_name = "terraform-training-${var.enviroment}-rg"
  virtual_network_name = azurerm_virtual_network.virt_network.name
  address_prefixes = [each.value]
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

