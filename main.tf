data "openstack_identity_endpoint_v3" "identity_endpoint_v3_lookup" {
  for_each = var.identity_endpoint_v3_lookup

  endpoint_region = each.value.endpoint_region
  interface       = each.value.interface
  name            = each.value.name
  region          = each.value.region
  service_id      = each.value.service_id
  service_name    = each.value.service_name
  service_type    = each.value.service_type
}

