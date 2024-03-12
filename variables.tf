variable "location" {
  type        = string
  description = "The name of the location"
  default     = "uksouth"
}

variable "rg_name" {
  type        = string
  description = "The name of the resource group"
}

variable "tags" {
  type        = map(string)
  description = "The tags to be applied"
}

variable "gallery_name" {
  type        = string
  description = "The name of the shared image gallery"
}





variable "images" {
  description = "The block used to create 1 or more images"
  type        = list(object({
    name                                = string
    description                         = optional(string)
    specialized                         = optional(bool, false)
    hyper_v_generation                  = optional(string, "V2")
    os_type                             = optional(string)
    accelerated_network_support_enabled = optional(string)
    disk_types_not_allowed              = optional(list(string))
    end_of_life_date                    = optional(string)
    eula                                = optional(string)
    architecture                        = optional(string, "x64")
    max_recommended_vcpu_count          = optional(number)
    min_recommended_vcpu_count          = optional(number)
    max_recommended_memory_in_gb        = optional(number)
    min_recommended_memory_in_gb        = optional(number)
    privacy_statement_uri               = optional(string)
    release_note_uri                    = optional(string)
    trusted_launch_supported            = optional(bool)
    trusted_launch_enabled              = optional(bool)
    confidential_vm_supported           = optional(bool)
    confidential_vm_enabled             = optional(bool)
    identifier                          = object({
      offer     = string
      publisher = string
      sku       = string
    })
    purchase_plan = optional(object({
      name      = string
      publisher = optional(string)
      product   = optional(string)
    }))
  }))
}

