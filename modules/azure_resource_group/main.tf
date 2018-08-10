resource "azurerm_resource_group" "resource_group" {
  name     = "rg-partpay-${var.suffix}"
  location = "${var.location}"
}
