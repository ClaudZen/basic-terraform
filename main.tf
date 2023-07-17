data "azurerm_resource_group" "rg" {
  name = var.rg_name_cluster
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = var.cluster_name
  private_cluster_enabled = var.private_cluster

  default_node_pool {
    name       = "npaks"
    node_count = var.vm_replicas
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.environment
  }
}
