terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tf-st-hub-uaen-01"
    storage_account_name = "stausterraformuaen01"
    container_name       = "terraformstatefiles"
    key                  = "applications.tfstate"
  }
}

