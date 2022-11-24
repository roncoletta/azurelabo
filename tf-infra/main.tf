provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
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

resource "azurerm_kubernetes_cluster" "aks" {
  name                            = var.cluster-name
  location                        = azurerm_resource_group.rg.location
  resource_group_name             = azurerm_resource_group.rg.name
  api_server_authorized_ip_ranges = var.server_authorized_ip_ranges

  kubernetes_version        = var.kubernetes_version
  dns_prefix                = var.dns_prefix
  sku_tier                  = var.sku_tier
  open_service_mesh_enabled = var.open_service_mesh_enabled
  private_cluster_enabled   = var.private_cluster_enabled
  default_node_pool {
    name            = "default"
    node_count      = 1
    vm_size         = var.vm_size
    os_disk_size_gb = 30
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "Demo"
  }
}
resource "azurerm_container_registry" "acr" {
  name                = var.acr-name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = false
  network_rule_set    = []
  tags                = { "Environment" : "dev" }
  identity {
    type = "SystemAssigned"
  }
}

# add the role to the identity the kubernetes cluster was assigned
resource "azurerm_role_assignment" "kubweb_to_acr" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}
