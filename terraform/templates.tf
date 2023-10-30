data "template_file" "template" {
  template = file("../custom/conf/app.ini")
  vars = {
    webapp_url     = azurerm_linux_web_app.app.default_hostname
    db_server_name = azurerm_postgresql_server.db.fqdn
  }
}

resource "local_file" "output_file" {
  filename = "../custom/conf/app.ini"
  content  = data.template_file.template.rendered
}
