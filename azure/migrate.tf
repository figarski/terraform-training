moved {
    from = azurerm_subnet.subnet_f1
    to = module.networking.azurerm_subnet.subnet_f1
}

moved {
    from = azurerm_subnet.subnet_f2
    to = module.networking.azurerm_subnet.subnet_f2
}

moved {
    from = azurerm_virtual_network.virt_network
    to = module.networking.azurerm_virtual_network.virt_network
}

moved {
    from = random_pet.random_f
    to = module.networking.random_pet.random_f
}
