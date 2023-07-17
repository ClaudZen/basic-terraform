resource "azurerm_resource_group" "rg" {
  name     = "ic"
  location = "brazilsouth"
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "core"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "core"
  private_cluster_enabled = var.private_cluster

  default_node_pool {
    name       = "corepool"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.environment
  }
}
