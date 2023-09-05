variable "location" {
  default = "UAE North"
}
variable "Environment" {
  default = "Non-Production"
}
variable "ARM_HUB_CLIENT_SECRET" {
}
variable "ARM_HUB_CLIENT_ID" {
}
variable "ARM_HUB_SUBSCRIPTION_ID" {
}

##RG DETAILS
variable "rg_details" {

  type = map(object({

    rg_name       = string
    purpose  = string
  }))

  default = {

    rg-nonprod-app-uaen-01 = {
      rg_name       = "rg-nonprod-app-uaen-01"
      purpose  = "App Resources for infrastructure"
    },
    rg-nonprod-storage-uaen-01 = {
      rg_name       = "rg-nonprod-storage-uaen-01"
      purpose  = "Boot Diagnostics Resources for staging"
    },
    rg-nonprod-keyvault-uaen-01 = {
      rg_name       = "rg-nonprod-keyvault-uaen-01"
      purpose  = "Key vault"
    },
    rg-nonprod-db-uaen-01 = {
      rg_name       = "rg-nonprod-db-uaen-01"
      purpose  = "DB Resources for infrastructure"
    },
    rg-nonprod-web-uaen-01 = {
      rg_name       = "rg-nonprod-web-uaen-01"
      purpose  = "Web Resources for infrastructure"
    },
    rg-nonprod-network-uaen-01 = {
      rg_name       = "rg-nonprod-network-uaen-01"
      purpose  = "Network Resources for infrastructure"
    }
  }
}

variable "subnet_details" {

  type = map(object({

    subnet_name       = string
    address_prefixes  = list(string)
    resource_group_name = string
    virtual_network_name = string
  }))

  default = {

    snet-app-uaen-01 = {
      subnet_name       = "snet-app-uaen-01"
      address_prefixes  = ["10.232.1.0/24"]
      resource_group_name = "rg-nonprod-network-uaen-01"
      virtual_network_name = "vnet-nonprod-uaen-01"
    },
    snet-web-uaen-01 = {
      subnet_name       = "snet-web-uaen-01"
      address_prefixes  = ["10.232.2.0/24"]
      resource_group_name = "rg-nonprod-network-uaen-01"
      virtual_network_name = "vnet-nonprod-uaen-01"
    },
    snet-db-uaen-01 = {
      subnet_name       = "snet-db-uaen-01"
      address_prefixes  = ["10.232.3.0/24"]
      resource_group_name = "rg-nonprod-network-uaen-01"
      virtual_network_name = "vnet-nonprod-uaen-01"
    },
    snet-pep-uaen-01 = {
      subnet_name       = "snet-pep-uaen-01"
      address_prefixes  = ["10.232.4.0/24"]
      resource_group_name = "rg-nonprod-network-uaen-01"
      virtual_network_name = "vnet-nonprod-uaen-01"
    },
    snet-transit-uaen-01 = {
      subnet_name       = "snet-transit-uaen-01"
      address_prefixes  = ["10.232.5.0/24"]
      resource_group_name = "rg-nonprod-network-uaen-01"
      virtual_network_name = "vnet-nonprod-uaen-01"
    },
    snet-storage-uaen-01 = {
      subnet_name       = "snet-storage-uaen-01"
      address_prefixes  = ["10.232.6.0/24"]
      resource_group_name = "rg-nonprod-network-uaen-01"
      virtual_network_name = "vnet-nonprod-uaen-01"
    }
  }
}

##NSG DETAILS

variable "nsg_details" {

  type = map(object({

    nsg_name       = string
    resource_group_name = string
    purpose  = string
  }))

  default = {

    nsg-snet-app-uaen-01 = {
      nsg_name       = "nsg-snet-app-uaen-01"
      resource_group_name = "rg-nonprod-network-uaen-01"
      purpose = "Network Security Group for Application"
    },
    nsg-snet-web-uaen-01 = {
      nsg_name       = "nsg-snet-web-uaen-01"
      resource_group_name = "rg-nonprod-network-uaen-01"
      purpose = "Network Security Group for Web"
    },
    nsg-snet-db-uaen-01 = {
      nsg_name       = "nsg-snet-db-uaen-01"
      resource_group_name = "rg-nonprod-network-uaen-01"
      purpose = "Network Security Group for DB"
    },
    nsg-snet-pep-uaen-01 = {
      nsg_name       = "nsg-snet-pep-uaen-01"
      resource_group_name = "rg-nonprod-network-uaen-01"
      purpose = "Network Security Group for private endpoint"
    },
    nsg-snet-transit-uaen-01 = {
      nsg_name       = "nsg-snet-transit-uaen-01"
      resource_group_name = "rg-nonprod-network-uaen-01"
      purpose = "Network Security Group for transit"
    },
    nsg-snet-storage-uaen-01 = {
      nsg_name       = "nsg-snet-storage-uaen-01"
      resource_group_name = "rg-nonprod-network-uaen-01"
      purpose = "Network Security Group for storage"
    }
  }
}

##NSG ASSOCIATION

variable "nsg_association" {

  type = map(object({

    subnet_name       = string
    nsg_name          = string

  }))

  default = {

    app = {
      subnet_name = "snet-app-uaen-01"
      nsg_name = "nsg-snet-app-uaen-01"
    },
    db = {
      subnet_name       = "snet-db-uaen-01"
      nsg_name            = "nsg-snet-db-uaen-01"
    },
    web = {
      subnet_name       = "snet-web-uaen-01"
      nsg_name            = "nsg-snet-web-uaen-01"
    },
    pep= {
      subnet_name       = "snet-pep-uaen-01"
      nsg_name       = "nsg-snet-pep-uaen-01"
    },
    transit = {
      subnet_name       = "snet-transit-uaen-01"
      nsg_name       = "nsg-snet-transit-uaen-01"
    },
    storage = {
      subnet_name       = "snet-storage-uaen-01"
      nsg_name       = "nsg-snet-storage-uaen-01"
    }
  }
}

##ROUTE DETAILS

variable "route_details" {

  type = map(object({

    route_table_name       = string
    route_name  = string
    purpose = string
    address_prefixes = string
    next_hop_type = string
    next_hop_in_ip_address = string
    resource_group_name = string
  }))

  default = {

    rt-snet-web-uaen-01 = {
      route_table_name       = "rt-snet-web-uaen-01"
      route_name            = "rt-snet-web-uaen-01"
      purpose = "Route table for Web"
      address_prefixes = "0.0.0.0/0"
      next_hop_type = "VirtualAppliance"
      next_hop_in_ip_address = "10.220.3.4"
      resource_group_name = "rg-nonprod-network-uaen-01"
    },
    rt-snet-app-uaen-01 = {
      route_table_name       = "rt-snet-app-uaen-01"
      route_name            = "rt-snet-app-uaen-01"
      purpose = "Route table for app"
      address_prefixes = "0.0.0.0/0"
      next_hop_type = "VirtualAppliance"
      next_hop_in_ip_address = "10.220.3.4"
      resource_group_name = "rg-nonprod-network-uaen-01"
    },
    rt-snet-db-uaen-01 = {
      route_table_name       = "rt-snet-db-uaen-01"
      route_name            = "rt-snet-db-uaen-01"
      purpose = "Route table for DB"
      address_prefixes = "0.0.0.0/0"
      next_hop_type = "VirtualAppliance"
      next_hop_in_ip_address = "10.220.3.4"
      resource_group_name = "rg-nonprod-network-uaen-01"
    },
    rt-snet-pep-uaen-01 = {
      route_table_name       = "rt-snet-pep-uaen-01"
      route_name       = "rt-snet-pep-uaen-01"
      purpose = "Route table for private endpoint"
      address_prefixes = "0.0.0.0/0"
      next_hop_type = "VirtualAppliance"
      next_hop_in_ip_address = "10.220.3.4"
      resource_group_name = "rg-nonprod-network-uaen-01"
    },
    rt-snet-transit-uaen-01 = {
      route_table_name       = "rt-snet-transit-uaen-01"
      route_name       = "rt-snet-transit-uaen-01"
      purpose = "Route table for transit"
      address_prefixes = "0.0.0.0/0"
      next_hop_type = "VirtualAppliance"
      next_hop_in_ip_address = "10.220.3.4"
      resource_group_name = "rg-nonprod-network-uaen-01"
    },
    rt-snet-storage-uaen-01 = {
      route_table_name       = "rt-snet-storage-uaen-01"
      route_name       = "rt-snet-storage-uaen-01"
      purpose = "Route table for storage"
      address_prefixes = "0.0.0.0/0"
      next_hop_type = "VirtualAppliance"
      next_hop_in_ip_address = "10.220.3.4"
      resource_group_name = "rg-nonprod-network-uaen-01"
    }
  }
}

##ROUTE ASSOCIATION

variable "route_association" {

  type = map(object({

    route_table_name       = string
    subnet_name          = string

  }))

  default = {

    web = {
      route_table_name = "rt-snet-web-uaen-01"
      subnet_name      = "snet-web-uaen-01"
    },
    app = {
      route_table_name = "rt-snet-app-uaen-01"
      subnet_name      = "snet-app-uaen-01"
    },
    db = {
      route_table_name       = "rt-snet-db-uaen-01"
      subnet_name            = "snet-db-uaen-01"
    },
    pep= {
      route_table_name       = "rt-snet-pep-uaen-01"
      subnet_name            = "snet-pep-uaen-01"
    },
    transit = {
      route_table_name       = "rt-snet-transit-uaen-01"
      subnet_name            = "snet-transit-uaen-01"
    },
    storage = {
      route_table_name       = "rt-snet-storage-uaen-01"
      subnet_name            = "snet-storage-uaen-01"
    }
  }
}



##VNET DETAILS

variable "vnet_details" {

  type = map(object({

    vnet_name       = string
    resource_group_name = string
    address_space  = list(string)
    purpose  = string
  }))

  default = {

    vnet-nonprod-uaen-01 = {
      vnet_name      = "vnet-nonprod-uaen-01"
      resource_group_name = "rg-nonprod-network-uaen-01"
      address_space  = ["10.232.0.0/16"]
      purpose = "Nonprod Virtual network"
    }
  }
}

##VNET PEERING NONPROD to HUB

variable "vnet_peering_nonprod_to_hub" {

  type = map(object({

    vnet_peering_name  = string
    resource_group_name = string
    virtual_network_name = string
  }))

  default = {

    peering-nonprod-to-hub = {
      vnet_peering_name = "peering-nonprod-to-hub"
      resource_group_name = "rg-nonprod-network-uaen-01"
      virtual_network_name  = "vnet-nonprod-uaen-01"
      
    }
  }
}

##VNET PEERING HUB to NONPROD


variable "resource_group_name_hub" {
  type = string
   default = "rg_hub_uaenorth_001"
}
variable "hub_vnet_name" {
   type = string
    default = "vnet_hub_uaenorth_001"
}

variable "vnet_peering_hub_to_nonprod" {

  type = map(object({

    vnet_peering_name  = string
  }))

  default = {

    peering-nonprod-to-hub = {
      vnet_peering_name = "peering-hub-to-nonprod"
    }
  }
}

##STORAGE DETAILS

variable "storage_details" {

  type = map(object({

    st_name       = string
    purpose  = string
    resource_group = string
    account_tier = string
    account_replication_type = string
  }))

  default = {

    teststbootdiagnonprod = {
      st_name       = "teststbootdiagnonprod"
      purpose  = "Diagnostic logs for nonprod"
      resource_group = "rg-nonprod-storage-uaen-01"
      account_tier = "Standard"
      account_replication_type = "LRS"
      
    }
}
}

##STORAGE ACCOUNT ENCRYPTION DETAILS

variable "encryption_scopes" {
  description = "Encryption scopes, keys are scope names. more info https://docs.microsoft.com/en-us/azure/storage/common/infrastructure-encryption-enable?tabs=portal"
  type = map(object({
    source                           = optional(string)
    enable_infrastructure_encryption = optional(bool)
    
  }))

  default = {
      teststbootdiagnonprod = {
         source = "Microsoft.Storage"
         enable_infrastructure_encryption = true
      } 
  }
}

variable "account_kind" {
  description = "Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2"
  type        = string
  default     = "StorageV2"
}

variable "enable_large_file_share" {
  description = "Enable Large File Share."
  type        = bool
  default     = false
}

variable "enable_hns" {
  description = "Enable Hierarchical Namespace (can be used with Azure Data Lake Storage Gen 2)."
  type        = bool
  default     = false
}

/*variable "enable_sftp" {
  description = "Enable SFTP for storage account (enable_hns must be set to true for this to work)."
  type        = bool
  default     = false
}*/

variable "enable_https_traffic_only" {
  description = "Forces HTTPS if enabled."
  type        = bool
  default     = true
}

variable "min_tls_version" {
  description = "The minimum supported TLS version for the storage account."
  type        = string
  default     = "TLS1_2"
}

variable "allow_nested_items_to_be_public" {
  description = "Allow or disallow public access to all blobs or containers in the storage account."
  type        = bool
  default     = false
}

variable "access_list" {
  description = "Map of CIDRs Storage Account access."
  type        = string
  default     = "10.232.0.0/16"
}

variable "service_endpoints" {
  description = "Creates a virtual network rule in the subnet_id (values are virtual network subnet ids)."
  type        = map(string)
  default     = {
    "subnet1" = "10.232.2.0/24",
    "subnet2" = "10.232.1.0/24",
    "subnet3" = "10.232.3.0/24"
  }

}

variable "traffic_bypass" {
  description = "Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None."
  type        = string
  default     = "Microsoft network routing"
}

/*variable "blob_delete_retention_days" {
  description = "Retention days for deleted blob. Valid value is between 1 and 365 (set to 0 to disable)."
  type        = number
  default     = 7
}*/
variable "infrastructure_encryption_enabled" {
  description = "Is infrastructure encryption enabled? Changing this forces a new resource to be created."
  type        = bool
  default     = true
}

variable "nfsv3_enabled" {
  description = "Is NFSv3 protocol enabled? Changing this forces a new resource to be created"
  type        = bool
  default     = false
}

variable "default_network_rule" {
  description = "Specifies the default action of allow or deny when no other network rules match"
  type        = string
  default     = "Deny"

  validation {
    condition     = (contains(["deny", "allow"], lower(var.default_network_rule)))
    error_message = "The default_network_rule must be either \"Deny\" or \"Allow\"."
  }
}
variable "network_rules" {
  description = "Network rules restricting access to the storage account."
  type = object({
    ip_rules   = list(string)
    subnet_ids = list(string)
    bypass     = list(string)
  })
  default = null
}
variable "shared_access_key_enabled" {
  description = "Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key"
  type        = bool
  default     = true
}

variable "blob_versioning_enabled" {
  description = "Controls whether blob object versioning is enabled."
  type        = bool
  default     = false
}

##Network rules for storage account

/*locals {
  network_rule = [
  /*type = map(object({
    
    ip_rules = list(string)
    st_name = string
    subnet_name = string

  }))
  #default = {
    teststbootdiagnonprod = {
      st_name = "teststbootdiagnonprod"
      subnet_name = azurerm_subnet.subnet[0].id
      ip_rules = ["10.232.2.0/24"]
    },
    teststbootdiagnonprod = {
      st_name = "teststbootdiagnonprod"
      subnet_name = azurerm_subnet.subnet[1].id
      ip_rules = ["10.232.1.0/24"]
    },
    teststbootdiagnonprod = {
      st_name = "teststbootdiagnonprod"
      subnet_name = azurerm_subnet.subnet[2].id
      ip_rules = ["10.232.3.0/24"]
    },
#}
]
}*/

locals {
  network_rule = [
  #   type = map(object({
    
  #     ip_rules = list(string)
  #     st_name = string
  #     subnet_name = string

  # }))
  #default = {
    {
      name         = "rule1",
      st_name = "teststbootdiagnonprod"
      subnet_name = "snet-web-uaen-01"
      ip_rules = ["10.232.2.0/24"]
    },
    {
      name         = "rule2",
      st_name = "teststbootdiagnonprod"
      subnet_name = "snet-app-uaen-01"
      ip_rules = ["10.232.1.0/24"]
    },
    {
      name         = "rule3",
      st_name = "teststbootdiagnonprod"
      subnet_name = "snet-db-uaen-01"
      ip_rules = ["10.232.3.0/24"]
    },
#}
]
}
