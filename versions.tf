terraform {
  required_version = ">= 0.15"

   backend "azurerm" {
    key = "west001.tfstate"
    resource_group_name   = "AZWE-AAP-STATE"
    storage_account_name  = "aapautomationstate"
    container_name        = "automationstate"
  }

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      
    }
    
    databricks = {
      source = "databricks/databricks"
     
      
      
    }
  }
}