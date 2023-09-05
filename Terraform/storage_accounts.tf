    resource "azurerm_storage_account" "main" {
      for_each = var.storage_details
      name     = each.value.st_name
      resource_group_name = each.value.resource_group
      location = var.location
      account_tier = each.value.account_tier
      account_replication_type = each.value.account_replication_type
      is_hns_enabled                    = var.enable_hns
      #sftp_enabled                      = var.enable_sftp
      large_file_share_enabled          = var.enable_large_file_share
      allow_nested_items_to_be_public   = var.allow_nested_items_to_be_public
      enable_https_traffic_only         = var.enable_https_traffic_only
      min_tls_version                   = var.min_tls_version
      nfsv3_enabled                     = var.nfsv3_enabled
      infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
      shared_access_key_enabled         = var.shared_access_key_enabled

  dynamic "network_rules" {
    for_each = var.network_rules != null ? ["true"] : []
    content {
      default_action             = "Deny"
      ip_rules                   = var.network_rules.ip_rules
      virtual_network_subnet_ids = var.network_rules.subnet_ids
      bypass                     = var.network_rules.bypass
    }
  } 

  identity {
    type = "SystemAssigned"
  }
  
      tags = {
        Environment = var.Environment
        Location = var.location
        Purpose = each.value.purpose
      }
    
    } 
  # dynamic "blob_properties" {
  #   for_each = ((var.account_kind == "BlockBlobStorage" || var.account_kind == "StorageV2") ? [1] : [])
  #   content {
  #     versioning_enabled = var.blob_versioning_enabled

  #     dynamic "delete_retention_policy" {
  #       for_each = (var.blob_delete_retention_days == 0 ? [] : [1])
  #       content {
  #         days = var.blob_delete_retention_days
  #       }
  #     }
      
  #     dynamic "container_delete_retention_policy" {
  #       for_each = (var.container_delete_retention_days == 0 ? [] : [1])
  #       content {
  #         days = var.container_delete_retention_days
  #       }
  #     }
  #   }
  # }

resource "azurerm_storage_encryption_scope" "scope" {
  for_each = var.encryption_scopes

  name                               = each.key
  storage_account_id                 = azurerm_storage_account.main[each.key].id
  source                             = each.value.source
  infrastructure_encryption_required = each.value.enable_infrastructure_encryption
}
/*resource "azurerm_storage_account_network_rules" "rules" {
     for_each = local.network_rule
     storage_account_id = azurerm_storage_account.main[each.value.st_name].id
     default_action      = "Deny"  
     virtual_network_subnet_ids = each.value.subnet_name
     bypass              = ["AzureServices"] 
     ip_rules = each.value.ip_rules
   }*/


resource "azurerm_storage_account_network_rules" "rules" {
     for_each = { for rule in local.network_rule : rule.name => rule }
     storage_account_id = azurerm_storage_account.main[each.value.st_name].id
     default_action      = "Deny"  
     virtual_network_subnet_ids = [
         for rule in local.network_rule : azurerm_subnet.subnet[rule.subnet_name].id
     ]  
     bypass              = ["AzureServices"] 
     #ip_rules = each.value.ip_rules
   }
