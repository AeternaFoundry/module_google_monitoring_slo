output "monitoring_slos_id" {
  description = "Map of id values across all monitoring_slos, keyed the same as var.monitoring_slos except keys with no id are omitted"
  value       = { for k, v in google_monitoring_slo.monitoring_slos : k => v.id if v.id != null && length(v.id) > 0 }
}
output "monitoring_slos_basic_sli" {
  description = "Map of basic_sli values across all monitoring_slos, keyed the same as var.monitoring_slos except keys with no basic_sli are omitted"
  value       = { for k, v in google_monitoring_slo.monitoring_slos : k => one(v.basic_sli) if v.basic_sli != null && length(v.basic_sli) > 0 }
}
output "monitoring_slos_calendar_period" {
  description = "Map of calendar_period values across all monitoring_slos, keyed the same as var.monitoring_slos except keys with no calendar_period are omitted"
  value       = { for k, v in google_monitoring_slo.monitoring_slos : k => v.calendar_period if v.calendar_period != null && length(v.calendar_period) > 0 }
}
output "monitoring_slos_deletion_policy" {
  description = "Map of deletion_policy values across all monitoring_slos, keyed the same as var.monitoring_slos except keys with no deletion_policy are omitted"
  value       = { for k, v in google_monitoring_slo.monitoring_slos : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "monitoring_slos_display_name" {
  description = "Map of display_name values across all monitoring_slos, keyed the same as var.monitoring_slos except keys with no display_name are omitted"
  value       = { for k, v in google_monitoring_slo.monitoring_slos : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "monitoring_slos_goal" {
  description = "Map of goal values across all monitoring_slos, keyed the same as var.monitoring_slos except keys with no goal are omitted"
  value       = { for k, v in google_monitoring_slo.monitoring_slos : k => v.goal if v.goal != null }
}
output "monitoring_slos_name" {
  description = "Map of name values across all monitoring_slos, keyed the same as var.monitoring_slos except keys with no name are omitted"
  value       = { for k, v in google_monitoring_slo.monitoring_slos : k => v.name if v.name != null && length(v.name) > 0 }
}
output "monitoring_slos_project" {
  description = "Map of project values across all monitoring_slos, keyed the same as var.monitoring_slos except keys with no project are omitted"
  value       = { for k, v in google_monitoring_slo.monitoring_slos : k => v.project if v.project != null && length(v.project) > 0 }
}
output "monitoring_slos_request_based_sli" {
  description = "Map of request_based_sli values across all monitoring_slos, keyed the same as var.monitoring_slos except keys with no request_based_sli are omitted"
  value       = { for k, v in google_monitoring_slo.monitoring_slos : k => one(v.request_based_sli) if v.request_based_sli != null && length(v.request_based_sli) > 0 }
}
output "monitoring_slos_rolling_period_days" {
  description = "Map of rolling_period_days values across all monitoring_slos, keyed the same as var.monitoring_slos except keys with no rolling_period_days are omitted"
  value       = { for k, v in google_monitoring_slo.monitoring_slos : k => v.rolling_period_days if v.rolling_period_days != null }
}
output "monitoring_slos_service" {
  description = "Map of service values across all monitoring_slos, keyed the same as var.monitoring_slos except keys with no service are omitted"
  value       = { for k, v in google_monitoring_slo.monitoring_slos : k => v.service if v.service != null && length(v.service) > 0 }
}
output "monitoring_slos_slo_id" {
  description = "Map of slo_id values across all monitoring_slos, keyed the same as var.monitoring_slos except keys with no slo_id are omitted"
  value       = { for k, v in google_monitoring_slo.monitoring_slos : k => v.slo_id if v.slo_id != null && length(v.slo_id) > 0 }
}
output "monitoring_slos_user_labels" {
  description = "Map of user_labels values across all monitoring_slos, keyed the same as var.monitoring_slos except keys with no user_labels are omitted"
  value       = { for k, v in google_monitoring_slo.monitoring_slos : k => v.user_labels if v.user_labels != null && length(v.user_labels) > 0 }
}
output "monitoring_slos_windows_based_sli" {
  description = "Map of windows_based_sli values across all monitoring_slos, keyed the same as var.monitoring_slos except keys with no windows_based_sli are omitted"
  value       = { for k, v in google_monitoring_slo.monitoring_slos : k => one(v.windows_based_sli) if v.windows_based_sli != null && length(v.windows_based_sli) > 0 }
}

