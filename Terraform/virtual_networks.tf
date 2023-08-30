 resource "azurerm_virtual_network" "vnet" {
  for_each = var.vnet_details
  name                = each.value.vnet_name
  resource_group_name = each.value.resource_group_name
  location = var.location
  address_space       = each.value.address_space
  depends_on = [azurerm_resource_group.resource_group]
tags = {
    Environment = var.Environment
    Location = var.location
    Purpose = each.value.purpose
  }
}
