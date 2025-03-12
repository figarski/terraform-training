data "terraform_remote_state" "remote_data_subnet_example" {
  backend = "azurerm"
  config = {
    resource_group_name  = "terraform-training-dev-rg"
    storage_account_name = "tfstatepekaoserval"
    container_name       = "tfstatecointainer"
    key                  = "pekao_warsztat_tfstatedev"
  }
}

output "get_subnet_f_id1" {
  value = data.terraform_remote_state.remote_data_subnet_example.outputs.subnet_f_id1
}