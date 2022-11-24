variable "cluster-name" {
  default = "labo-cluster"
}
variable "acr-name" {
  default = "acrlabodemo"
}
variable "rg_name" {
  default = "rg-aks"
}

variable "la-workspace-id" {
  default = ""
}
variable "tenant_id" {
  default = ""
}
variable "server_authorized_ip_ranges" {
  default = ["255.255.255.255/32"]
}
variable "object_id" {
  default = ""
}

variable "admin_group_object_ids" {
  default = ["", ""]
}

variable "location" {
  default = "canadacentral"
  validation {
    condition     = "canadacentral" == var.location || "canadaeast" == var.location
    error_message = "The resource_name must be greater than 5 characters in length."
  }
}

variable "kubernetes_version" {
  default = "1.23.12"
}

variable "dns_prefix" {
  default = "lab"
}

variable "sku_tier" {
  default = "Free"
}

variable "vm_size" {
  default = "Standard_B2s"
}

variable "diagnostics" {
  default = {
    log = [
      # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
      ["ContainerRegistryRepositoryEvents", true, true, 60],
      ["ContainerRegistryLoginEvents", true, true, 60],

    ]
    metric = [
      #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
      ["AllMetrics", true, true, 60],
    ]
  }
}

variable "open_service_mesh_enabled" {
  default = true
}

variable "private_cluster_enabled" {
  default = false
}
