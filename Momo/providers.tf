provider "azurerm" {
  features {}
   subscription_id = "5bc9535c-f673-4696-ba85-1c24860e4382"
 
 /**
  client_id       = "712f566c-a1e7-4ff2-8bc0-f63601246ef8"
  client_secret   = "KOc8Q~3SUoC.brto3cIlKGjd6tumPUyoe5aPobBC"
  tenant_id       = "eb70b763-b6d7-4486-8555-8831709a784e"
  **/
}
provider "databricks" {
  azure_workspace_resource_id = azurerm_databricks_workspace.this.id

  
}