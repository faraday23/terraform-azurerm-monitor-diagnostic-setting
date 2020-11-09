data "azurerm_storage_account" "storage_account" {
  name                = var.storage_account
  resource_group_name = var.sa_resource_group
}

