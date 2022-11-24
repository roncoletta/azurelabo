variable "rg_name" {
    default = "rg-tfstate"
} 

variable "location" {
    default = "canadacentral"
    validation {
        condition     = "canadacentral" == var.location || "canadaeast" == var.location
        error_message = "The resource_name must be greater than 5 characters in length."
  }
}

variable "sa_name" {
    default = "sasavestateterraform"
}

variable "sa_account_tier" {
    default = "Standard"
}

variable "sa_access_tier" {
    default = "Hot"
}

variable "sa_account_replication_type" {
    default = "GRS"
}

variable "sa_enable_https_traffic_only" {
    default = true
}