provider "azurerm" {
  features {}

  subscription_id = "09cda0bd-60c6-4722-be9c-25858b5ce1b3"
  use_cli = true  # Allows Terraform to use Azure CLI authentication
}

resource "azurerm_resource_group" "rg" {
  name     = "aks-resource-group"
  location = "Central India"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "my-aks-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aksdns"

  default_node_pool {
    name            = "default"
    node_count      = 2  # Using 2 nodes
    vm_size         = "Standard_B2s"  # Free-tier compatible VM size
  }

  identity {
    type = "SystemAssigned"
  }
}