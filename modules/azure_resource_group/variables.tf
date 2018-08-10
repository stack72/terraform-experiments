variable "suffix" {
  description = "The suffix used for this resource group (i.e prod, uat)"
}

variable "location" {
  description = "The azure region where this resource group should be hosted"
}

output "resource_group" {
  value = "${azurerm_resource_group.resource_group.name}"
}
