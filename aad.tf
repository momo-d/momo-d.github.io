/**

resource "random_password" "service_principal" {
  length  = 16
  special = true
}

resource "azurerm_key_vault_secret" "service_principal" {
  name         = "service-principal-password"
  value        = random_password.service_principal.result
  key_vault_id = azurerm_key_vault.this.id
}

resource azurerm_role_assignment adftoadb_role_assignment {
  scope                = azurerm_databricks_workspace.this.id
  role_definition_name = "Custom Role for subscription users"
  principal_id         = "9337c908-29a5-4e63-aacc-6afb93e8eb30"
}



resource "azuread_service_principal_password" "this" {
  service_principal_id = azuread_service_principal.this.id
  value                = azurerm_key_vault_secret.service_principal.value
}


resource "azurerm_role_assignment" "this" {
  scope                = azurerm_storage_account.this.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azuread_service_principal.this.object_id
}
**/


resource azurerm_role_assignment adftoadb_role_assignment {
  scope                = azurerm_databricks_workspace.this.id
  role_definition_name = "Custom Role for subscription users"
  principal_id         = "9337c908-29a5-4e63-aacc-6afb93e8eb30"
  
   depends_on = [
    azurerm_databricks_workspace.this
  ]
}