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
        enabled = true
        days    = lookup(var.ds_log_api_endpoints, log.value, null)
      }
    }
  }

  dynamic "metric" {
    for_each = keys(var.ds_allmetrics_rentention_days)
    content {
    category = metric.value
      
    retention_policy {
      enabled = true
      days    = lookup(var.ds_allmetrics_rentention_days, metric.value, null)
      }
    }
  }
}
