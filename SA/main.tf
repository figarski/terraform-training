terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.1.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

resource "random_pet" "random_f" {
  length = 1
}


resource "azurerm_storage_account" "tfstate" {
  name = "tfstatepekao${random_pet.random_f.id}"
  location = "east us"
  resource_group_name =  "terraform-training-dev-rg"
  account_tier = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name = "tfstatecointainer"
  storage_account_name = azurerm_storage_account.tfstate.name
  container_access_type = "blob"
}