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
  client_id       = "3c0aeb3c-f046-44af-8241-dc5508dc5d4d"     # appId
  client_secret   = "HSI8Q~lnhS5DXROWRH1zwvdmiGv3qTZN-jmjObum" # password
  tenant_id       = "dad88b20-14ed-40fc-bdf0-07032373d636"     # tenant
  subscription_id = "f6ea3f89-3ee9-4c9c-906d-08b5cd8e4730"     # subscription_id
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