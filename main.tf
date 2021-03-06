data "azurerm_storage_account" "storage_account" {
  name                = var.storage_account
  resource_group_name = var.sa_resource_group
}

resource "azurerm_monitor_diagnostic_setting" "diagsetting" {
  name               = var.target_resource_name
  target_resource_id = var.target_resource_id
  storage_account_id = data.azurerm_storage_account.storage_account.id

  dynamic "log" {
    for_each = keys(var.ds_log_api_endpoints)
    content {
      category = log.value
      enabled  = true

      retention_policy {
        enabled = var.enable_retention_policy
        days    = lookup(var.ds_log_api_endpoints, log.value, 0)
      }
    }
  }

  dynamic "metric" {
    for_each = keys(var.ds_metrics_retention_days)
    content {
      category = metric.value

      retention_policy {
        enabled = var.enable_retention_policy
        days    = lookup(var.ds_metrics_retention_days, metric.value, 0)
      }
    }
  }
}
