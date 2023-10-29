terraform {
  backend "azurerm" {
    resource_group_name  = "Gogs"
    storage_account_name = "gogsstorage"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}
