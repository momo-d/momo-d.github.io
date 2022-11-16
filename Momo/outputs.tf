

/**output "storage_account" {
  sensitive = true
  value = {
    name           = azurerm_storage_account.this.name
    container_name = azurerm_storage_data_lake_gen2_filesystem.this.name
    access_key     = azurerm_storage_account.this.primary_access_key
  }
}**/

/**output "synapse" {
  sensitive = true
  value = {
    database = azurerm_synapse_sql_pool.this.name
    host     = azurerm_synapse_workspace.this.connectivity_endpoints
    user     = azurerm_synapse_workspace.this.sql_administrator_login
    password = azurerm_synapse_workspace.this.sql_administrator_login_password
  }
}**/