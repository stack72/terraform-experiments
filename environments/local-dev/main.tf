module "azure_resource_group" {
    source = "../../modules/azure_resource_group"
    suffix = "${var.suffix}"
    location = "${var.location}"
}

module "azure_service_bus" {
    source = "../../modules/azure_service_bus"
    suffix = "${var.suffix}"
    location = "${var.location}"
}