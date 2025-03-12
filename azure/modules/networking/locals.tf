locals {
    subnets = {
        "subnet1" = {
            name = "subnet1"
            address_prefixes = [var.address_prefixes[0]]
}
        "subnet2" = {
            name = "subnet2"
            address_prefixes = [var.address_prefixes[1]]
            }
    }
    }