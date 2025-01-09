resource "azurerm_kubernetes_cluster" "aks-test-nook" {
  provider                = azurerm.spoke
  name                    = "aks-test-nook"
  azure_policy_enabled    = true
  resource_group_name     = azurerm_resource_group.rg-adl-osr-nook.name
  location                = azurerm_resource_group.rg-adl-osr-nook.location
  kubernetes_version      = "1.30.4"
  dns_prefix              = "aks-test-nook"
  private_cluster_enabled = true
  private_dns_zone_id     = "/subscriptions/756952db-9653-4f48-bed7-49ea8d2a8ada/resourceGroups/rg-adl-connectivity-hub-jpe-dev/providers/Microsoft.Network/privateDnsZones/adl-hub-dev.privatelink.japaneast.azmk8s.io"
  # enable_managed_identity = true
  workload_identity_enabled = true
  oidc_issuer_enabled       = true
  default_node_pool {
    name           = "default"
    node_count     = 1
    vm_size        = "Standard_B2als_v2"
    vnet_subnet_id = azurerm_subnet.snet-adl-osr-nook-aks.id
  }
  #   microsoft_defender {
  #     log_analytics_workspace_id = "/subscriptions/136a99b2-083d-40d8-9761-34eba2731fc4/resourceGroups/rg-common-monitor-services-dev/providers/Microsoft.OperationalInsights/workspaces/Log-analytics-workspace-mfaf-centralize-stg"
  #   }
  identity {
    # type = "SystemAssigned"
    type         = "UserAssigned"
    identity_ids = ["/subscriptions/756952db-9653-4f48-bed7-49ea8d2a8ada/resourceGroups/rg-adl-connectivity-hub-jpe-dev/providers/Microsoft.ManagedIdentity/userAssignedIdentities/aks-private-dns-identity"]
  }
  network_profile {
    # docker_bridge_cidr = "10.17.0.1/16"
    dns_service_ip = "10.2.0.10"
    network_plugin = "kubenet"
    outbound_type  = "userDefinedRouting"
    service_cidr   = "10.2.0.0/24"
  }
  # oms_agent {
  #   log_analytics_workspace_id = "/subscriptions/136a99b2-083d-40d8-9761-34eba2731fc4/resourceGroups/rg-common-monitor-services-dev/providers/Microsoft.OperationalInsights/workspaces/Log-analytics-workspace-mfaf-centralize-stg"
  # }
}

resource "azurerm_kubernetes_cluster_node_pool" "user" {
  provider              = azurerm.spoke
  name                  = "user"
  vnet_subnet_id        = azurerm_subnet.snet-adl-osr-nook-aks.id
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks-test-nook.id
  vm_size               = "Standard_B2als_v2"
  node_count            = 1
  os_type               = "Linux"
  priority              = "Regular"
  scale_down_mode       = "Delete"
  spot_max_price        = -1
  mode                  = "User"
    enable_auto_scaling    = "false"
  #   enable_host_encryption = false
  #   enable_node_public_ip  = false
  ultra_ssd_enabled = false
  fips_enabled      = false
  # max_count         = 1
  # min_count         = 1
  node_taints       = []
  linux_os_config {
    sysctl_config {
      net_netfilter_nf_conntrack_max = 1048576
    }
  }
}
