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

variable "address_prefixes" {
  type = list(string)
  default = [ "10.0.0.0/24", "10.0.1.0/24" ]
}

# variable "address_prefixes2" {
#   type = list(string)
# }

variable "addresses" {
  type = map(string)
}

# variable "address_prefixes2" {
#   type = object({
#     subnet1 = string
#     subnet2 = string
#   })
# }

# variable "subnet1" {
#   type = string
#   description = "subnet1"
# }

# variable "subnet2" {
#   type = string
#   description = "subnet2"
# }

# variable "address_prefixes3" {
#   type = list(string)
#   default = [ "10.0.0.0/24", "10.0.1.0/24" ]
# }

# variable "address_prefixes4" {
#   type = list(object({
#     subnet1 = string
#     subnet2 = string
#   }))
#   default = [ {
#     subnet1 = "10.0.0.0/24"
#     subnet2 = "10.0.1.0/24"
#   } ]

# }

variable "rg_count" {
  type = number
  default = 3
}

variable "storage_accounts" {
  type = map(string)
  default = {
    "dev" = "devstorageaccount"
    "pre" = "prestorageaccount"
  }
}
