variable "location" {
  default = "UAE North"
}
variable "Environment" {
  default = "Production"
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

    rg-applications-web-uaen-01 = {
      rg_name       = "rg-applications-web-uaen-01"
      purpose  = "Web Resources for applications"
    },
    rg-applications-db-uaen-01 = {
      rg_name       = "rg-applications-db-uaen-01"
      purpose  = "DB Resources for applications"
    },
    rg-applications-app-uaen-01 = {
      rg_name       = "rg-applications-app-uaen-01"
      purpose  = "App Resources for applications"
    },
    rg-applications-storage-uaen-01 = {
      rg_name       = "rg-applications-storage-uaen-01"
      purpose  = "Boot Diagnostics Storage Resources for applications"
    },
    rg-applications-keyvault-uaen-01 = {
      rg_name       = "rg-applications-keyvault-uaen-01"
      purpose  = "Key vault"
    },
    rg-applications-network-uaen-01 = {
      rg_name       = "rg-applications-network-uaen-01"
      purpose  = "Network Resources for infrastructure"
    }
  }
}

#SUBNET BLOCK

variable "subnet_details" {

  type = map(object({

    subnet_name       = string
    address_prefixes  = list(string)
    resource_group_name = string
    virtual_network_name = string
  }))

  default = {

    snet-applications-web-uaen-01 = {
      subnet_name       = "snet-applications-web-uaen-01"
      address_prefixes  = ["10.223.1.0/24"]
      resource_group_name = "rg-applications-network-uaen-01"
      virtual_network_name = "vnet-applications-uaen-01"
    },
    snet-applications-app-uaen-01 = {
      subnet_name       = "snet-applications-app-uaen-01"
      address_prefixes  = ["10.223.2.0/24"]
      resource_group_name = "rg-applications-network-uaen-01"
      virtual_network_name = "vnet-applications-uaen-01"
    },
    snet-applications-db-uaen-01 = {
      subnet_name       = "snet-applications-db-uaen-01"
      address_prefixes  = ["10.223.3.0/24"]
      resource_group_name = "rg-applications-network-uaen-01"
      virtual_network_name = "vnet-applications-uaen-01"
    },
    snet-applications-storage-uaen-01 = {
       subnet_name       = "snet-applications-storage-uaen-01"
       address_prefixes  = ["10.223.4.0/24"]
       resource_group_name = "rg-applications-network-uaen-01"
       virtual_network_name = "vnet-applications-uaen-01"
    },
    snet-applications-transit-uaen-01 = {
      subnet_name       = "snet-applications-transit-uaen-01"
      address_prefixes  = ["10.223.5.0/24"]
      resource_group_name = "rg-applications-network-uaen-01"
      virtual_network_name = "vnet-applications-uaen-01"
    },
    snet-applications-pep-uaen-01 = {
      subnet_name       = "snet-applications-pep-uaen-01"
      address_prefixes  = ["10.223.6.0/24"]
      resource_group_name = "rg-applications-network-uaen-01"
      virtual_network_name = "vnet-applications-uaen-01"
    }
  }
}



#VNET BLOCK

variable "vnet_details" {

  type = map(object({

    vnet_name       = string
    resource_group_name = string
    address_space  = list(string)
    purpose  = string
  }))

  default = {

    vnet-applications-uaen-01 = {
      vnet_name      = "vnet-applications-uaen-01"
      resource_group_name = "rg-applications-network-uaen-01"
      address_space  = ["10.223.0.0/16"]
      purpose  = "applications production virtual network"
    }
  }
}


#STORAGE ACCOUNT BLOCK

variable "storage_details" {

  type = map(object({

    st_name       = string
    purpose  = string
    resource_group = string
    account_tier = string
    account_replication_type = string
  }))

  default = {

    stbootdiagappsuaen01 = {
      st_name       = "stbootdiagappsuaen01"
      purpose  = "Diagnostic logs for Terraform runner in Applications"
      resource_group = "rg-applications-storage-uaen-01"
      account_tier = "Standard"
      account_replication_type = "LRS"
      
    }
}
}


#NSG DETAILS BLOCK

variable "nsg_details" {

  type = map(object({

    nsg_name       = string
    resource_group_name = string
    purpose  = string
  }))

  default = {

    nsg-snet-applications-web-uaen-01 = {
      nsg_name       = "nsg-snet-applications-web-uaen-01"
      resource_group_name = "rg-applications-network-uaen-01"
      purpose  = "Network Security Group for Web"
    },
    nsg-snet-applications-app-uaen-01 = {
      nsg_name       = "nsg-snet-applications-app-uaen-01"
      resource_group_name = "rg-applications-network-uaen-01"
      purpose  = "Network Security Group for applications"
    },
    nsg-snet-applications-db-uaen-01 = {
      nsg_name       = "nsg-snet-applications-db-uaen-01"
      resource_group_name = "rg-applications-network-uaen-01"
      purpose  = "Network Security Group for DB"
    },
    nsg-snet-applications-storage-uaen-01 = {
      nsg_name       = "nsg-snet-applications-storage-uaen-01"
      resource_group_name = "rg-applications-network-uaen-01"
      purpose  = "Network Security Group for storage"
    },  
    nsg-snet-applications-transit-uaen-01 = {
      nsg_name       = "nsg-snet-applications-transit-uaen-01"
      resource_group_name = "rg-applications-network-uaen-01"
      purpose  = "Network Security Group for transit"
    },
    nsg-snet-applications-pep-uaen-01 = {
      nsg_name       = "nsg-snet-applications-pep-uaen-01"
      resource_group_name = "rg-applications-network-uaen-01"
      purpose  = "Network Security Group for private endpoint"
    }
  }
}

#NSG ASSOCIATION

variable "nsg_association" {

  type = map(object({

    subnet_name       = string
    nsg_name          = string

  }))

  default = {

    web = {
      subnet_name = "snet-applications-web-uaen-01"
      nsg_name = "nsg-snet-applications-web-uaen-01"
    },
    app = {
      subnet_name       = "snet-applications-app-uaen-01"
      nsg_name            = "nsg-snet-applications-app-uaen-01"
    },
    db = {
      subnet_name       = "snet-applications-db-uaen-01"
      nsg_name            = "nsg-snet-applications-db-uaen-01"
    },
    storage = {
      subnet_name       = "snet-applications-storage-uaen-01"
      nsg_name            = "nsg-snet-applications-storage-uaen-01"
    },  
    transit = {
      subnet_name       = "snet-applications-transit-uaen-01"
      nsg_name            = "nsg-snet-applications-transit-uaen-01"
    },    
    pep = {
      subnet_name       = "snet-applications-pep-uaen-01"
      nsg_name            = "nsg-snet-applications-pep-uaen-01"
    }
  }
}


#ROUTE DEATILS

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

    rt-snet-applications-web-uaen-01 = {
      route_table_name       = "rt-snet-applications-web-uaen-01"
      route_name            = "rt-snet-applications-web-uaen-01"
      purpose = "Route table for web"
      address_prefixes = "0.0.0.0/0"
      next_hop_type = "VirtualAppliance"
      next_hop_in_ip_address = "10.220.3.4"
      resource_group_name = "rg-applications-network-uaen-01"
    },
    rt-snet-applications-app-uaen-01 = {
      route_table_name       = "rt-snet-applications-app-uaen-01"
      route_name            = "rt-snet-applications-app-uaen-01"
      purpose = "Route table for app"
      address_prefixes = "0.0.0.0/0"
      next_hop_type = "VirtualAppliance"
      next_hop_in_ip_address = "10.220.3.4"
      resource_group_name = "rg-applications-network-uaen-01"
    },
    rt-snet-applications-db-uaen-01 = {
      route_table_name       = "rt-snet-applications-db-uaen-01"
      route_name            = "rt-snet-applications-db-uaen-01"
      purpose = "Route table for db"
      address_prefixes = "0.0.0.0/0"
      next_hop_type = "VirtualAppliance"
      next_hop_in_ip_address = "10.220.3.4"
      resource_group_name = "rg-applications-network-uaen-01"
    },
    rt-snet-applications-storage-uaen-01 = {
      route_table_name       = "rt-snet-applications-storage-uaen-01"
      route_name            = "rt-snet-applications-storage-uaen-01"
      purpose = "Route table for storage"
      address_prefixes = "0.0.0.0/0"
      next_hop_type = "VirtualAppliance"
      next_hop_in_ip_address = "10.220.3.4"
      resource_group_name = "rg-applications-network-uaen-01"
    },    
    rt-snet-applications-transit-uaen-01 = {
      route_table_name       = "rt-snet-applications-transit-uaen-01"
      route_name            = "rt-snet-applications-transit-uaen-01"
      purpose = "Route table for transit"
      address_prefixes = "0.0.0.0/0"
      next_hop_type = "VirtualAppliance"
      next_hop_in_ip_address = "10.220.3.4"
      resource_group_name = "rg-applications-network-uaen-01"
    },    
    rt-snet-applications-pep-uaen-01 = {
      route_table_name       = "rt-snet-applications-pep-uaen-01"
      route_name            = "rt-snet-applications-pep-uaen-01"
      purpose = "Route table for private endpoint"
      address_prefixes = "0.0.0.0/0"
      next_hop_type = "VirtualAppliance"
      next_hop_in_ip_address = "10.220.3.4"
      resource_group_name = "rg-applications-network-uaen-01"
    }
  }
}

#ROUTE ASSOCIATION

variable "route_association" {

  type = map(object({

    route_table_name       = string
    subnet_name          = string

  }))

  default = {

    web = {
      route_table_name = "rt-snet-applications-web-uaen-01"
      subnet_name      = "snet-applications-web-uaen-01"
    },
    app = {
      route_table_name = "rt-snet-applications-app-uaen-01"
      subnet_name      = "snet-applications-app-uaen-01"
    },
    db = {
      route_table_name       = "rt-snet-applications-db-uaen-01"
      subnet_name            = "snet-applications-db-uaen-01"
    },
    storage = {
      route_table_name       = "rt-snet-applications-storage-uaen-01"
      subnet_name            = "snet-applications-storage-uaen-01"
    },   
    transit = {
      route_table_name       = "rt-snet-applications-transit-uaen-01"
      subnet_name            = "snet-applications-transit-uaen-01"
    },     
    pep= {
      route_table_name       = "rt-snet-applications-pep-uaen-01"
      subnet_name            = "snet-applications-pep-uaen-01"
    }
  }
}


##VNET PEERING applications to HUB

variable "vnet_peering_applications_to_hub" {

  type = map(object({

    vnet_peering_name  = string
    resource_group_name = string
    virtual_network_name = string
  }))

  default = {

    peering-applications-to-hub = {
      vnet_peering_name = "peering-applications-to-hub"
      resource_group_name = "rg-applications-network-uaen-01"
      virtual_network_name  = "vnet-applications-uaen-01"
      
    }
  }
}

##VNET PEERING HUB to applications


variable "resource_group_name_hub" {
  type = string
   default = "rg_hub_uaenorth_001"
}
variable "hub_vnet_name" {
   type = string
    default = "vnet_hub_uaenorth_001"
}

variable "vnet_peering_hub_to_applications" {

  type = map(object({

    vnet_peering_name  = string
  }))

  default = {

    peering-hub-to-applications = {
      vnet_peering_name = "peering-hub-to-applications"
    }
  }
}





