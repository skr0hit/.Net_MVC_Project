provider "azurerm" {
  features {}
  subscription_id = "09cda0bd-60c6-4722-be9c-25858b5ce1b3"
  use_cli = true  # Allows Terraform to use Azure CLI authentication
}

module "resource_group" {
  source              = "./modules/resource_group"

  resource_group_name = var.resource_group_name
  location           = var.location
}

module "aks_cluster"{

  source = "./modules/aks_cluster"
  cluster_name = var.cluster_name
  resource_group_name = var.resource_group_name
  location = var.location
  node_count = var.node_count
  vm_size = var.vm_size

}