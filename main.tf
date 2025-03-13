terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }

  # backend "azurerm" {
  #   resource_group_name = "terraform-training-dev-rg"
  #   storage_account_name = "tfstatepekaoserval"
  #   container_name = "tfstatecointainer"
  #   key = "pekao_warsztat_tfstatedev"
  # }

}

provider "azurerm" {
  features {

  }
}

data "terraform_remote_state" "network" {
  backend = "azurerm"

  config = {
    resource_group_name  = "terraform-training-dev-rg"
    storage_account_name = "tfstatepekaoserval"
    container_name       = "tfstatecointainer"
    key                  = "pekao_warsztat_tfstatedev"
  }
}

output "vnet_id_remote" {
  value = data.terraform_remote_state.network.outputs.vnet_id
}

resource "azurerm_resource_group" "rg" {
  #   count = var.rg_count
  name     = "terraform-training-dev-rg"
  location = "east us"
}

# resource "azurerm_resource_group" "rg2" {
#   for_each = toset(["aa1","aa2"])
#   name = "terraform-training-dev-rg-${each.value}"
#   location = "east us"
# }

variable "enviroment" {
  type    = string
  default = "dev"
}

variable "rg_count" {
  type    = number
  default = 3
}

variable "address_prefixes" {
  type = map(string)
  default = {
    subnet1 = "10.0.1.0/24"
    subnet2 = "10.0.2.0/24"
  }
}

module "networking" {
  source    = "./modules/networking"
  addresses = var.address_prefixes
}

module "keyvault" {
  source = "./modules/keyvault"
}

# resource "random_pet" "random_f" {
#   length = 1
# }

resource "azurerm_storage_account" "stacct" {
  name                     = "stacctkl"
  location                 = "east us"
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "videos" {
  name                  = "videos"
  storage_account_name  = azurerm_storage_account.stacct.name
  container_access_type = "blob"
}

resource "azurerm_storage_table" "logs" {
  name                 = "logs"
  storage_account_name = azurerm_storage_account.stacct.name
}