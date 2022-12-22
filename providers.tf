provider "azurerm" {
  features {}
 subscription_id = "5bc9535c-f673-4696-ba85-1c24860e4382"
}

provider "databricks" {
  
  azure_workspace_resource_id = azurerm_databricks_workspace.this.id
  
}