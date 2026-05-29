terraform {
  required_version = ">= 1.14.1"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.57.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "ohaymngmtproject"
    storage_account_name = "ohaymngmtstorage"
    container_name       = "tfstate"
    key                  = "iac-azure-template.tfstate"
  }
}

provider "azurerm" {
  features {}
}