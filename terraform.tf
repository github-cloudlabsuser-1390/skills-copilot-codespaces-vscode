# Define the provider
provider "azurerm" {
  features {}
}

# Define variables
variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "location" {
  description = "Location for the storage account"
  type        = string
  default     = "eastus"
}

variable "sku_name" {
  description = "SKU for the storage account"
  type        = string
  default     = "Standard_LRS"
}

# Define the resource for the storage account
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = var.sku_name

  # Optional: Enable advanced threat protection
  advanced_threat_protection_enabled = true

  # Optional: Enable blob encryption
  blob_encryption_enabled = true

  # Optional: Enable file encryption
  file_encryption_enabled = true

  # Optional: Enable hierarchical namespace (for Data Lake Storage Gen2)
  enable_hierarchical_namespace = true
}

# Define the resource group (if not already defined)
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = var.location
}