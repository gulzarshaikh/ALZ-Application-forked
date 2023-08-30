resource "azurerm_network_security_group" "main"{
  for_each = var.nsg_details
  name = each.value.nsg_name
  location = var.location
  resource_group_name = each.value.resource_group_name
  depends_on = [azurerm_resource_group.resource_group]
tags = {
    Environment = var.Environment
    Location = var.location
    Purpose = each.value.purpose
}
}
resource "azurerm_subnet_network_security_group_association" "main" {
  for_each                  = var.nsg_association
  subnet_id                 = azurerm_subnet.subnet[each.value.subnet_name].id
  network_security_group_id = azurerm_network_security_group.main[each.value.nsg_name].id
  depends_on = [azurerm_subnet.subnet]
}
