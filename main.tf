resource "azurerm_shared_image" "shared_image" {
  for_each                            = { for k, v in var.images : k => v }
  gallery_name                        = var.gallery_name
  resource_group_name                 = var.rg_name
  location                            = var.location
  tags                                = var.tags
  name                                = try(each.value.name, null)
  description                         = try(each.value.description, null)
  specialized                         = try(each.value.specialised, null)
  hyper_v_generation                  = upper(try(each.value.hyper_v_generation, null))
  os_type                             = title(each.value.os_type)
  accelerated_network_support_enabled = try(each.value.accelerated_network_support_enabled, null)
  eula                                = each.value.eula
  end_of_life_date                    = each.value.end_of_life_date
  disk_types_not_allowed              = each.value.disk_types_not_allowed
  architecture                        = each.value.architecture
  max_recommended_vcpu_count          = each.value.max_recommended_vcpu_count
  min_recommended_vcpu_count          = each.value.min_recommended_vcpu_count
  max_recommended_memory_in_gb        = each.value.max_recommended_memory_in_gb
  min_recommended_memory_in_gb        = each.value.min_recommended_memory_in_gb
  release_note_uri                    = each.value.release_note_uri
  trusted_launch_enabled              = each.value.trusted_launch_enabled
  trusted_launch_supported            = each.value.trusted_launch_supported
  confidential_vm_enabled             = each.value.confidential_vm_enabled
  confidential_vm_supported           = each.value.confidential_vm_supported

  dynamic "identifier" {
    for_each = each.value.identifier != null ? [each.value.identifier] : []
    content {
      offer     = identifier.value.offer
      publisher = identifier.value.publisher
      sku       = identifier.value.sku
    }
  }

  dynamic "purchase_plan" {
    for_each = each.value.purchase_plan != null ? [each.value.purchase_plan] : []
    content {
      name      = purchase_plan.value.name
      publisher = purchase_plan.value.publisher
      product   = purchase_plan.value.product
    }
  }
}
