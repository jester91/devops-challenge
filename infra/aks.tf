resource "azurerm_kubernetes_cluster" "aks" {
  name                = "devops-challenge-aks"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "devops-challenge"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
    outbound_type = "loadBalancer"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "agentpool" {
  name                  = "agentpool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 2
  max_pods              = 110
  os_disk_size_gb       = 30
  os_type               = "Linux"
}
