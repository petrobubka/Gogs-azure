output "webapp_url" {
  value = azurerm_linux_web_app.app.default_hostname
}

output "postgresql_server_name" {
  value = azurerm_postgresql_server.db.fqdn
}
output "postgresql_admin_username" {
  value = azurerm_postgresql_server.db.administrator_login
}
