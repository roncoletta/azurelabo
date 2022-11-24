provider "azurerm" {
  features {}  
}

terraform {  
  backend "azurerm" {   
  }
}

resource "azurerm_resource_group" "rg" {
  name = var.rg_name
  location = var.location  
  tags = local.common_tags
}

resource "azurerm_key_vault" "kv" {
  name                        = var.name
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}
/*
resource "azurerm_management_lock" "rg-lock" {
  name       = "rg-level"
  scope      =  azurerm_resource_group.rg.id
  lock_level = "CanNotDelete"
  notes      = "Items can't be deleted in this rg"
}
*/
