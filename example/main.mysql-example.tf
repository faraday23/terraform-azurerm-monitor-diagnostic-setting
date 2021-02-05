# Diagnostic setting
module "ds_mysql_server" {
  source               = "github.com/[redacted]/terraform-azurerm-monitor-diagnostic-setting.git"
  storage_account      = module.storage_account.storage_account_name
  sa_resource_group    = module.resource_group.name
  target_resource_id   = module.mysql.id
  target_resource_name = module.resource_group.name

  ds_log_api_endpoints = { "MySqlSlowLogs" = var.mysqlslowlogs,
    "MySqlAuditLogs" = var.mysqlauditlogs
  }

  ds_metrics_retention_days = { "AllMetrics" = var.allmetrics
  }
}
  
# Diagnostic settings 

variable "storage_account_resource_group" {
  description = "Azure resource group where the storage account resides."
  type        = string
}

variable "storage_endpoint" {
  description = "This blob storage will hold all diagnostic setting audit logs. Required if state is Enabled."
  type        = string
  default     = ""
}

variable "storage_account_access_key" {
  description = "Specifies the identifier key of the Threat Detection audit storage account. Required if state is Enabled."
  type        = string
  default     = ""
}

variable "mysqlslowlogs" {
  description = "The slow query log is a record of SQL queries that took a long time to perform."
  type        = number
  default     = 0
}

variable "mysqlauditlogs" {
  description = "produce a log file containing an audit record of server activity. The log contents include when clients connect and disconnect, and what actions they perform while connected, such as which databases and tables they access.."
  type        = number
  default     = 0
}

variable "all_metrics" {
  description = "Retention only applies to storage account. Retention policy ranges from 1 to 365 days. If you do not want to apply any retention policy and retain data forever, set retention (days) to 0."
  type        = number
  default     = 0
}
