resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_service_plan" "plan" {
  name                = "${var.app_service_name}-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_postgresql_server" "db" {
  name                = "gogs-db"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  version             = "11"

  administrator_login          = "myadminuser"
  administrator_login_password = "P@ssw0rd!" # Replace with a strong password

  auto_grow_enabled     = false
  backup_retention_days = 7
  sku_name              = "B_Gen5_1" # Adjust based on your requirements

  ssl_enforcement_enabled          = false
  ssl_minimal_tls_version_enforced = "TLSEnforcementDisabled"
}

resource "azurerm_postgresql_firewall_rule" "allow_all" {
  name                = "allow-all"
  server_name         = azurerm_postgresql_server.db.name
  resource_group_name = azurerm_resource_group.rg.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}

resource "azurerm_linux_web_app" "app" {
  name                = var.app_service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    always_on = false
  }

  app_settings = {
    "key" = "value"
  }
}

