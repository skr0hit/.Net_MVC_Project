output "resource_group_name" {
  value = module.resource_group.resource_group_name
  description = "The name of the resource group"
}

output "aks_cluster_name" {
  value = module.aks_cluster.cluster_name
  description = "The name of the AKS cluster"
}