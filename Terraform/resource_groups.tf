resource "azurerm_resource_group" "resource_group" {
  for_each = var.rg_details

  name     = each.value.rg_name
  location = var.location  # Define your desired Azure region here
  tags = {
    Environment = var.Environment
    Location = var.location
    Purpose = each.value.purpose
  }
}

