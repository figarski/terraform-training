terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.1.0"
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


resource "azurerm_resource_group" "rg" {
    name = "terraform-training-dev-rg"
    location = "east us"
}

variable "enviroment" {
  type = string
  default = "dev"
}


