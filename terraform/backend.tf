terraform {
  backend "azurerm" {
    resource_group_name  = "Gogs"
    storage_account_name = "gogsstorage"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
    client_id            = $ARM_CLIENT_ID
    client_secret        = $ARM_CLIENT_SECRET
    tenant_id            = $ARM_TENANT_ID
  }
}
