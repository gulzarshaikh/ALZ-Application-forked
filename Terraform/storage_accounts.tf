    resource "azurerm_storage_account" "main" {
      for_each = var.storage_details
      name     = each.value.st_name
      resource_group_name = each.value.resource_group
      location = var.location
      account_tier = each.value.account_tier
      account_replication_type = each.value.account_replication_type
      depends_on = [azurerm_resource_group.resource_group]
      tags = {
        Environment = var.Environment
        Location = var.location
        Purpose = each.value.purpose
      }
    
    }
