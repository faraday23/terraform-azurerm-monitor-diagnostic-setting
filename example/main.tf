# Diagnostic setting for mssql db
module "diagnostic_mssql_db" {
  source               = "github.com/faraday23/terraform-azurerm-monitor-diagnostic-setting.git"
  count                = var.blocks > 0 || var.database_wait_statistics > 0 || var.deadlocks > 0 || var.error_log > 0 || var.timeouts > 0 || var.query_store_runtime_statistics > 0 || var.query_store_wait_statistics > 0 || var.sql_insights > 0 || var.basic > 0 || var.instance_and_app_advanced > 0 || var.workload_management > 0 ? 1 : 0
  storage_account      = var.storage_account
  sa_resource_group    = var.sa_resource_group
  target_resource_id   = azurerm_mssql_database.db.id
  target_resource_name = azurerm_mssql_database.db.name

  ds_log_api_endpoints = { "AutomaticTuning" = var.automatic_tuning,
    "Blocks"                      = var.blocks,
    "DatabaseWaitStatistics"      = var.database_wait_statistics,
    "Deadlocks"                   = var.deadlocks,
    "Errors"                      = var.error_log,
    "Timeouts"                    = var.timeouts,
    "QueryStoreRuntimeStatistics" = var.query_store_runtime_statistics,
    "QueryStoreWaitStatistics"    = var.query_store_wait_statistics,
    "SQLInsights"                 = var.sql_insights
  }
  ds_allmetrics_retention_days = { "Basic" = var.basic,
    "InstanceAndAppAdvanced" = var.instance_and_app_advanced,
    "WorkloadManagement"     = var.workload_management
  }
}
