output "vnet_id" {
  value = module.networking.vnet_id
}

output "subnet_f_id1" {
  value = module.networking.subnet_f_id1
}

output "subnet_f_id2" {
  value = module.networking.subnet_f_id2
}

output "subnet_f_names" {
  value = module.networking.subnet_names
}

# output "storage_account_id" {
#   value = azurerm_storage_account.tfstate.name
#   }
