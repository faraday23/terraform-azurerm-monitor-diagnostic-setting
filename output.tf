output "retention_days" {
  value = var.ds_log_api_endpoints.value > 0 ? true : false
}
