variable "identity_endpoint_v3_lookup" {
  description = <<EOT
Map of identity_endpoint_v3_lookup, attributes below
Optional:
    - endpoint_region
    - interface
    - name
    - region
    - service_id
    - service_name
    - service_type
EOT

  type = map(object({
    endpoint_region = optional(string)
    interface       = optional(string)
    name            = optional(string)
    region          = optional(string)
    service_id      = optional(string)
    service_name    = optional(string)
    service_type    = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.identity_endpoint_v3_lookup : (
        v.interface == null || (contains(["public", "internal", "admin"], v.interface))
      )
    ])
    error_message = "must be one of: \"public\", \"internal\", \"admin\""
  }
}

