variable "storage_account" {
  type        = string
  description = "Name of storage account"
}

variable "sa_resource_group" {
  type        = string
  description = "Name of resource group the storage account resides in"
}

variable "target_resource_name" {
  description = "Target resource name which will be also be applied as the name of monitor diagnostic setting."
  type        = string
}

variable "target_resource_id" {
  type        = string
  description = "Target resource id"
}

variable "ds_log_api_endpoints" {
  type        = map
  description = "Azure monitor diagnostic setting log API endpoints relevent to target resource. Value should be {\"api_endpoint = retention_days\"}. For example: {\"MySqlSlowLogs\" = 90, \"MySqlAuditLogs\" = 30}"
  default     = {}
}

variable "ds_metrics_retention_days" {
  type        = map
  description = "Azure monitor diagnostic setting category for retention in days of target resource."
  default     = {}
}

variable "metric_category" {
  type        = string
  description = "Metric category"
  default     = "AllMetrics"
}

variable "enable_retention_policy" {
  type        = string
  description = "toggle on/off the retention policy for the metric"
  default     = "false"
}
