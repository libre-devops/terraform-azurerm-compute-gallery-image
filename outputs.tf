output "image_gallery_name" {
  description = "The gallery name of the image"
  value       = { for k, v in azurerm_shared_image.shared_image : k => v.gallery_name }
}

output "image_id" {
  description = "The id of the image"
  value       = { for k, v in azurerm_shared_image.shared_image : k => v.id }
}

output "image_name" {
  description = "The name of the image"
  value       = { for k, v in azurerm_shared_image.shared_image : k => v.name }
}

output "image_resource_group_name" {
  description = "The rg name of the image"
  value       = { for k, v in azurerm_shared_image.shared_image : k => v.resource_group_name }
}
