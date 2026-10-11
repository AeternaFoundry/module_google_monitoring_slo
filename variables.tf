variable "monitoring_slos" {
  description = <<EOT
Map of monitoring_slos, attributes below
Required:
    - goal
    - service
Optional:
    - calendar_period
    - deletion_policy
    - display_name
    - project
    - rolling_period_days
    - slo_id
    - user_labels
    - basic_sli (block):
        - availability (optional, block):
            - enabled (optional)
        - latency (optional, block):
            - threshold (required)
        - location (optional)
        - method (optional)
        - version (optional)
    - request_based_sli (block):
        - distribution_cut (optional, block):
            - distribution_filter (required)
            - range (required, block):
                - max (optional)
                - min (optional)
        - good_total_ratio (optional, block):
            - bad_service_filter (optional)
            - good_service_filter (optional)
            - total_service_filter (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - windows_based_sli (block):
        - good_bad_metric_filter (optional)
        - good_total_ratio_threshold (optional, block):
            - basic_sli_performance (optional, block):
                - availability (optional, block):
                    - enabled (optional)
                - latency (optional, block):
                    - threshold (required)
                - location (optional)
                - method (optional)
                - version (optional)
            - performance (optional, block):
                - distribution_cut (optional, block):
                    - distribution_filter (required)
                    - range (required, block):
                        - max (optional)
                        - min (optional)
                - good_total_ratio (optional, block):
                    - bad_service_filter (optional)
                    - good_service_filter (optional)
                    - total_service_filter (optional)
            - threshold (optional)
        - metric_mean_in_range (optional, block):
            - range (required, block):
                - max (optional)
                - min (optional)
            - time_series (required)
        - metric_sum_in_range (optional, block):
            - range (required, block):
                - max (optional)
                - min (optional)
            - time_series (required)
        - window_period (optional)
EOT

  type = map(object({
    goal                = number
    service             = string
    calendar_period     = optional(string)
    deletion_policy     = optional(string)
    display_name        = optional(string)
    project             = optional(string)
    rolling_period_days = optional(number)
    slo_id              = optional(string)
    user_labels         = optional(map(string))
    basic_sli = optional(object({
      availability = optional(object({
        enabled = optional(bool)
      }))
      latency = optional(object({
        threshold = string
      }))
      location = optional(set(string))
      method   = optional(set(string))
      version  = optional(set(string))
    }))
    request_based_sli = optional(object({
      distribution_cut = optional(object({
        distribution_filter = string
        range = object({
          max = optional(number)
          min = optional(number)
        })
      }))
      good_total_ratio = optional(object({
        bad_service_filter   = optional(string)
        good_service_filter  = optional(string)
        total_service_filter = optional(string)
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    windows_based_sli = optional(object({
      good_bad_metric_filter = optional(string)
      good_total_ratio_threshold = optional(object({
        basic_sli_performance = optional(object({
          availability = optional(object({
            enabled = optional(bool)
          }))
          latency = optional(object({
            threshold = string
          }))
          location = optional(set(string))
          method   = optional(set(string))
          version  = optional(set(string))
        }))
        performance = optional(object({
          distribution_cut = optional(object({
            distribution_filter = string
            range = object({
              max = optional(number)
              min = optional(number)
            })
          }))
          good_total_ratio = optional(object({
            bad_service_filter   = optional(string)
            good_service_filter  = optional(string)
            total_service_filter = optional(string)
          }))
        }))
        threshold = optional(number)
      }))
      metric_mean_in_range = optional(object({
        range = object({
          max = optional(number)
          min = optional(number)
        })
        time_series = string
      }))
      metric_sum_in_range = optional(object({
        range = object({
          max = optional(number)
          min = optional(number)
        })
        time_series = string
      }))
      window_period = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.monitoring_slos : (
        v.rolling_period_days == null || (v.rolling_period_days >= 1 && v.rolling_period_days <= 30)
      )
    ])
    error_message = "must be between 1 and 30"
  }
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

