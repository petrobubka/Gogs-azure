variable "rg_name" {
  type        = string
  description = "Resource group name"
  default     = "Gogs-terraform"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "East US"
}

variable "app_service_name" {
  type        = string
  description = "App Service name"
  default     = "Gogs"
}
