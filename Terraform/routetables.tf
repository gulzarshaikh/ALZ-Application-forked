resource "azurerm_route_table" "main" {
  for_each = var.route_details

  name     = each.value.route_table_name
  resource_group_name = each.value.resource_group_name
  location = var.location  # Define your desired Azure region here
  depends_on = [azurerm_resource_group.resource_group]
  tags = {
    Environment = var.Environment
    Location = var.location
    Purpose       = each.value.purpose
  }
  route {
    name = each.value.route_name
    address_prefix = each.value.address_prefixes
    next_hop_type = each.value.next_hop_type
    next_hop_in_ip_address = each.value.next_hop_in_ip_address
  }
}

resource "azurerm_subnet_route_table_association" "main" {
  for_each                  = var.route_association
  subnet_id                 = azurerm_subnet.subnet[each.value.subnet_name].id
  route_table_id            = azurerm_route_table.main[each.value.route_table_name].id
  depends_on = [azurerm_subnet.subnet]
}
