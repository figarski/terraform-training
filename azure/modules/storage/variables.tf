variable "location" {
  type = string
  default = "eastus"
}

variable "rg" {
  type = string
  default = "terraform-training-dev-rg"
}

variable "account_tier" {
  type = string
  default = "Standard"
}

variable "artype" {
  type = string
  default = "LRS"
}