variable "resource_group_name" {
  description = "Name of the Resource Group"
  type = string
  default = "skr_aks_rg"
}

variable "location" {
  description = "Location of the Resource group"
  type = string
  default = "Central India"
}

variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
  default = "skr_aks"
}


variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "Size of the VM nodes"
  type        = string
  default     = "Standard_B2s"
}