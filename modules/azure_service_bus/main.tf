
resource "azurerm_servicebus_namespace" "service_bus" {
  name                = "sb-partpay-${var.suffix}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  sku                 = "standard"
  lifecycle           = {}
}

resource "azurerm_servicebus_topic" "domain" {
  name                = "Domain"
  resource_group_name = "${var.resource_group_name}"
  namespace_name      = "${azurerm_servicebus_namespace.service_bus.name}"
}

resource "azurerm_servicebus_subscription" "event_handlers" {
  name                = "EventHandlers"
  resource_group_name = "${var.resource_group_name}"
  namespace_name      = "${azurerm_servicebus_namespace.service_bus.name}"
  topic_name          = "${azurerm_servicebus_topic.domain.name}"
  max_delivery_count  = 10
}

resource "azurerm_servicebus_subscription" "xero_integration_event_handlers" {
  name                = "XeroIntegrationEventHandlers"
  resource_group_name = "${var.resource_group_name}"
  namespace_name      = "${azurerm_servicebus_namespace.service_bus.name}"
  topic_name          = "${azurerm_servicebus_topic.domain.name}"
  max_delivery_count  = 10
}

resource "azurerm_servicebus_subscription" "zoho_integration_event_handlers" {
  name                = "ZohoIntegrationEventHandlers"
  resource_group_name = "${var.resource_group_name}"
  namespace_name      = "${azurerm_servicebus_namespace.service_bus.name}"
  topic_name          = "${azurerm_servicebus_topic.domain.name}"
  max_delivery_count  = 10
}

resource "azurerm_servicebus_subscription" "merchant_integration_event_handlers" {
  name                = "MerchantIntegrationEventHandlers"
  resource_group_name = "${var.resource_group_name}"
  namespace_name      = "${azurerm_servicebus_namespace.service_bus.name}"
  topic_name          = "${azurerm_servicebus_topic.domain.name}"
  max_delivery_count  = 10
}

resource "azurerm_servicebus_subscription" "authentication_integration_event_handlers" {
  name                = "AuthIntegrationEventHandlers"
  resource_group_name = "${var.resource_group_name}"
  namespace_name      = "${azurerm_servicebus_namespace.service_bus.name}"
  topic_name          = "${azurerm_servicebus_topic.domain.name}"
  max_delivery_count  = 10
}

resource "azurerm_servicebus_queue" "commands" {
  name                = "Commands"
  resource_group_name = "${var.resource_group_name}"
  namespace_name      = "${azurerm_servicebus_namespace.service_bus.name}"
}

resource "azurerm_servicebus_queue" "xero_commands" {
  name                = "XeroCommands"
  resource_group_name = "${var.resource_group_name}"
  namespace_name      = "${azurerm_servicebus_namespace.service_bus.name}"
}

resource "azurerm_servicebus_queue" "zoho_commands" {
  name                = "ZohoCommands"
  resource_group_name = "${var.resource_group_name}"
  namespace_name      = "${azurerm_servicebus_namespace.service_bus.name}"
}

resource "azurerm_servicebus_queue" "merchant_integration_commands" {
  name                = "MerchantIntegrationCommands"
  resource_group_name = "${var.resource_group_name}"
  namespace_name      = "${azurerm_servicebus_namespace.service_bus.name}"
}

resource "azurerm_servicebus_queue" "auth_integration_commands" {
  name                = "AuthIntegrationCommands"
  resource_group_name = "${var.resource_group_name}"
  namespace_name      = "${azurerm_servicebus_namespace.service_bus.name}"
}
