variable "enviroment" {
  type = string
  default = "dev"
}

variable "location" {
  type = string
  default = "eastus"
}

variable "address_space" {
  type = set(string)
  default = [ "10.0.0.0/16" ]
}

variable "addresses" {
    type = map(string)
}
