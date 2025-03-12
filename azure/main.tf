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

  backend "azurerm" {
    resource_group_name  = "terraform-training-dev-rg"
    storage_account_name = "tfstatepekaoserval"
    container_name       = "tfstatecointainer"
    key                  = "pekao_warsztat_tfstatedev"
  }

}

provider "azurerm" {
  features {

  }
}


resource "azurerm_resource_group" "rg" {
  name     = "terraform-training-dev-rg"
  location = "east us"
}

variable "enviroment" {
  type    = string
  default = "dev"
}

module "networking" {
  source = "./modules/networking"
  addresses = {
    subnet1 = "10.0.1.0/24"
    subnet2 = "10.0.2.0/24"
  }
}

# resource "random_pet" "random_f" {
#   length = 1
# }

# resource "azurerm_storage_account" "tfstate" {
#   name = "tfstatepekao${random_pet.random_f.id}"
#   location = "east us"
#   resource_group_name = azurerm_resource_group.rg.name
#   account_tier = "Standard"
#   account_replication_type = "LRS"
# }

# resource "azurerm_storage_container" "tfstate" {
#   name = "tfstatecontainer"
#   storage_account_name = azurerm_storage_account.tfstate.name
#   container_access_type = "blob"
# }
