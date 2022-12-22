locals {
  naming = {
    location = {
      "westeurope" = "euw"
    }
  }
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "this" {
  name = format("rg-%s-%s-%s",
  local.naming.location[var.location], var.environment, var.project)

  location = var.location
}



resource "azurerm_databricks_workspace" "this" {
  name = format("dbs-%s-%s-%s",
  local.naming.location[var.location], var.environment, var.project)

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  sku                 = var.databricks_sku


 custom_parameters {
    virtual_network_id                                   = "/subscriptions/5bc9535c-f673-4696-ba85-1c24860e4382/resourceGroups/AZWE-AAP-D-NETWORK/providers/Microsoft.Network/virtualNetworks/azweaapdvnet2"
    private_subnet_name                                  = "Privatedatabricks"
	private_subnet_network_security_group_association_id = "/subscriptions/5bc9535c-f673-4696-ba85-1c24860e4382/resourceGroups/Networks/providers/Microsoft.Network/networkSecurityGroups/nsg-default"
    public_subnet_name                                   = "Publicdatabricks"
	public_subnet_network_security_group_association_id  = "/subscriptions/5bc9535c-f673-4696-ba85-1c24860e4382/resourceGroups/Networks/providers/Microsoft.Network/networkSecurityGroups/nsg-default"
       
  }
   

}
