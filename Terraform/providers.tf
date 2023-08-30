terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}
 provider "azurerm" {
    features {}
  }

  provider "azurerm" {
    alias           = "hub"
    features {}
    client_id       = var.ARM_HUB_CLIENT_ID
    client_secret   = var.ARM_HUB_CLIENT_SECRET
    subscription_id = var.ARM_HUB_SUBSCRIPTION_ID
}
