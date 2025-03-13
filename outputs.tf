output "vnet_id" {
  value = module.networking.vnet_id
}

output "subnet_f_names" {
  value = module.networking.subnet_names
}


# output "primary_key" {
#   value = module.keyvault.
# }
# output "subnet_f_id2" {
#   value = module.networking.subnet_f_id2
#   }

# output "storage_account_id" {
#   value = azurerm_storage_account.tfstate.name
#   }
