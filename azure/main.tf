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
      resource_group_name = "terraform-training-dev-rg"
      storage_account_name = "tfstatepekaoserval"
      container_name = "tfstatecointainer"
      key = "pekao_warsztat_tfstatedev"
  }
}

output "vnet_id_remote" {
  value = data.terraform_remote_state.network.outputs.vnet_id
}

resource "azurerm_resource_group" "rg" {
    count = var.rg_count
    name = "terraform-training-dev-rg-${count.index}"
    location = "east us"
}

variable "enviroment" {
  type = string
  default = "dev"
}

variable "rg_count" {
  type = number
  default = 3
}

module "networking" {
  source = "./modules/networking"
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
