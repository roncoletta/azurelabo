
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_storage_account" "sa" {
  name                      = var.sa_name
  tags                      = local.common_tags
  access_tier               = var.sa_access_tier
  account_tier              = var.sa_account_tier
  location                  = azurerm_resource_group.rg.location
  resource_group_name       = azurerm_resource_group.rg.name
  enable_https_traffic_only = var.sa_enable_https_traffic_only
  account_replication_type  = var.sa_account_replication_type
}
