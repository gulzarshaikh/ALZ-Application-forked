resource "azurerm_subnet" "subnet" {
  for_each             = var.subnet_details
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
  depends_on = [azurerm_resource_group.resource_group,azurerm_virtual_network.vnet]
}
