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
    type = map
    description = "Azure monitor diagnostic setting log API endpoints relevent to target resource. Value should be {\"api_endpoint = retention_days\"}. For example: {\"MySqlSlowLogs\" = 90, \"MySqlAuditLogs\" = 30}"
    default = {}
}

variable "ds_allmetrics_rentention_days" {
    type = number
    description = "Azure monitor diagnostic setting all-metrics rention in days for target resource."
    default = 0
}

variable "metric_category" {
    type = string
    description = "Metric category"
    default = "AllMetrics"
}