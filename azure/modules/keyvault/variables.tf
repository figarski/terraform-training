variable "location" {
  type = string
  default = "eastus"
}

variable "rg" {
  type = string
  default = "terraform-training-dev-rg"
}

variable "sku_name" {
  type = string
  default = "standard"
}

variable "artype" {
  type = string
  default = "LRS"
}

variable "kvname" {
  type = string
  default = "kvnamefranciszek"
}