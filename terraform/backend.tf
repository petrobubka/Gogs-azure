terraform {
  backend "azurerm" {
    resource_group_name  = "Gogs"
    storage_account_name = "gogsstorage"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
    client_id            = var.ARM_CLIENT_ID
    client_secret        = var.ARM_CLIENT_SECRET
    tenant_id            = var.ARM_TENANT_ID
  }
}
