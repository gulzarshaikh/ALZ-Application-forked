data "azurerm_virtual_network" "hub_vnet" {
    provider = azurerm.hub
    name =  var.hub_vnet_name
    resource_group_name = var.resource_group_name_hub
}
data "azurerm_resource_group" "hub_rg" {
    provider = azurerm.hub
    name     = var.resource_group_name_hub
}
resource "azurerm_virtual_network_peering" "applications_to_hub_peering" {
 for_each = var.vnet_peering_applications_to_hub
 name = each.value.vnet_peering_name
 resource_group_name = each.value.resource_group_name
 virtual_network_name = each.value.virtual_network_name
 remote_virtual_network_id = data.azurerm_virtual_network.hub_vnet.id
 depends_on = [azurerm_virtual_network.vnet,azurerm_resource_group.resource_group]
}

resource "azurerm_virtual_network_peering" "hub_to_applications_peering" {
 provider = azurerm.hub
 for_each = var.vnet_peering_hub_to_applications
 name = each.value.vnet_peering_name
 resource_group_name = data.azurerm_resource_group.hub_rg.name
 virtual_network_name = data.azurerm_virtual_network.hub_vnet.name
 remote_virtual_network_id = azurerm_virtual_network.vnet["vnet-applications-uaen-01"].id
}
