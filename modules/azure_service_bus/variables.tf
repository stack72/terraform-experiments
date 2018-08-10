variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources"
}

variable "suffix" {
  description = "The suffix used for this service bus (i.e prod, uat)"
}

variable "location" {
  description = "The azure region where this service bus should be hosted"
}
