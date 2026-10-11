resource "google_monitoring_slo" "monitoring_slos" {
  for_each = var.monitoring_slos

  goal                = each.value.goal
  service             = each.value.service
  calendar_period     = each.value.calendar_period
  deletion_policy     = each.value.deletion_policy
  display_name        = each.value.display_name
  project             = each.value.project
  rolling_period_days = each.value.rolling_period_days
  slo_id              = each.value.slo_id
  user_labels         = each.value.user_labels

  dynamic "basic_sli" {
    for_each = each.value.basic_sli != null ? [each.value.basic_sli] : []
    content {
      dynamic "availability" {
        for_each = basic_sli.value.availability != null ? [basic_sli.value.availability] : []
        content {
          enabled = availability.value.enabled
        }
      }
      dynamic "latency" {
        for_each = basic_sli.value.latency != null ? [basic_sli.value.latency] : []
        content {
          threshold = latency.value.threshold
        }
      }
      location = basic_sli.value.location
      method   = basic_sli.value.method
      version  = basic_sli.value.version
    }
  }

  dynamic "request_based_sli" {
    for_each = each.value.request_based_sli != null ? [each.value.request_based_sli] : []
    content {
      dynamic "distribution_cut" {
        for_each = request_based_sli.value.distribution_cut != null ? [request_based_sli.value.distribution_cut] : []
        content {
          distribution_filter = distribution_cut.value.distribution_filter
          range {
            max = distribution_cut.value.range.max
            min = distribution_cut.value.range.min
          }
        }
      }
      dynamic "good_total_ratio" {
        for_each = request_based_sli.value.good_total_ratio != null ? [request_based_sli.value.good_total_ratio] : []
        content {
          bad_service_filter   = good_total_ratio.value.bad_service_filter
          good_service_filter  = good_total_ratio.value.good_service_filter
          total_service_filter = good_total_ratio.value.total_service_filter
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "windows_based_sli" {
    for_each = each.value.windows_based_sli != null ? [each.value.windows_based_sli] : []
    content {
      good_bad_metric_filter = windows_based_sli.value.good_bad_metric_filter
      dynamic "good_total_ratio_threshold" {
        for_each = windows_based_sli.value.good_total_ratio_threshold != null ? [windows_based_sli.value.good_total_ratio_threshold] : []
        content {
          dynamic "basic_sli_performance" {
            for_each = good_total_ratio_threshold.value.basic_sli_performance != null ? [good_total_ratio_threshold.value.basic_sli_performance] : []
            content {
              dynamic "availability" {
                for_each = basic_sli_performance.value.availability != null ? [basic_sli_performance.value.availability] : []
                content {
                  enabled = availability.value.enabled
                }
              }
              dynamic "latency" {
                for_each = basic_sli_performance.value.latency != null ? [basic_sli_performance.value.latency] : []
                content {
                  threshold = latency.value.threshold
                }
              }
              location = basic_sli_performance.value.location
              method   = basic_sli_performance.value.method
              version  = basic_sli_performance.value.version
            }
          }
          dynamic "performance" {
            for_each = good_total_ratio_threshold.value.performance != null ? [good_total_ratio_threshold.value.performance] : []
            content {
              dynamic "distribution_cut" {
                for_each = performance.value.distribution_cut != null ? [performance.value.distribution_cut] : []
                content {
                  distribution_filter = distribution_cut.value.distribution_filter
                  range {
                    max = distribution_cut.value.range.max
                    min = distribution_cut.value.range.min
                  }
                }
              }
              dynamic "good_total_ratio" {
                for_each = performance.value.good_total_ratio != null ? [performance.value.good_total_ratio] : []
                content {
                  bad_service_filter   = good_total_ratio.value.bad_service_filter
                  good_service_filter  = good_total_ratio.value.good_service_filter
                  total_service_filter = good_total_ratio.value.total_service_filter
                }
              }
            }
          }
          threshold = good_total_ratio_threshold.value.threshold
        }
      }
      dynamic "metric_mean_in_range" {
        for_each = windows_based_sli.value.metric_mean_in_range != null ? [windows_based_sli.value.metric_mean_in_range] : []
        content {
          range {
            max = metric_mean_in_range.value.range.max
            min = metric_mean_in_range.value.range.min
          }
          time_series = metric_mean_in_range.value.time_series
        }
      }
      dynamic "metric_sum_in_range" {
        for_each = windows_based_sli.value.metric_sum_in_range != null ? [windows_based_sli.value.metric_sum_in_range] : []
        content {
          range {
            max = metric_sum_in_range.value.range.max
            min = metric_sum_in_range.value.range.min
          }
          time_series = metric_sum_in_range.value.time_series
        }
      }
      window_period = windows_based_sli.value.window_period
    }
  }
}

