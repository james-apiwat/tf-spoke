# resource "azurerm_lb" "lb" {
#   provider            = azurerm.spoke
#   depends_on          = [azurerm_resource_group.rg-adl-osr-nook, azurerm_subnet.snet-adl-osr-nook-lb]
#   name                = "lb-adl-osr-nook"
#   location            = azurerm_resource_group.rg-adl-osr-nook.location
#   resource_group_name = azurerm_resource_group.rg-adl-osr-nook.name
#   sku                 = "Standard"

#   frontend_ip_configuration {
#     name                          = "lb-adl-osr-nook-d01"
#     subnet_id                     = azurerm_subnet.snet-adl-osr-nook-lb.id
#     private_ip_address_allocation = "Static"
#     private_ip_address            = "172.28.20.52"
#     zones                         = ["1", "2", "3"]
#   }

#   frontend_ip_configuration {
#     name                          = "lb-adl-osr-nook-d03"
#     subnet_id                     = azurerm_subnet.snet-adl-osr-nook-lb.id
#     private_ip_address_allocation = "Static"
#     private_ip_address            = "172.28.20.53"
#     zones                         = ["1", "2", "3"]
#   }

# }

# resource "azurerm_lb_probe" "lb_probe_9600" {
#   provider        = azurerm.spoke
#   loadbalancer_id = azurerm_lb.lb.id
#   name            = "tcp-9600-probe"
#   port            = 9600
# }

# resource "azurerm_lb_probe" "lb_probe_8080" {
#   provider        = azurerm.spoke
#   loadbalancer_id = azurerm_lb.lb.id
#   name            = "d03-probe-port-8080"
#   port            = 8080
# }

# resource "azurerm_lb_backend_address_pool" "lb_backend_d01" {
#   provider        = azurerm.spoke
#   depends_on      = [azurerm_lb.lb]
#   loadbalancer_id = azurerm_lb.lb.id
#   name            = "backend-adl-osr-nook-d01"
# }

# resource "azurerm_lb_backend_address_pool" "lb_backend_d03" {
#   provider        = azurerm.spoke
#   depends_on      = [azurerm_lb.lb]
#   loadbalancer_id = azurerm_lb.lb.id
#   name            = "d03-pool"
# }

# resource "azurerm_lb_backend_address_pool_address" "lb_backend_address_d01" {
#   count                   = 2
#   provider                = azurerm.spoke
#   depends_on              = [azurerm_lb_backend_address_pool.lb_backend_d01]
#   name                    = "adl-osr-nook-d01-${format("%03d", count.index + 1)}"
#   backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend_d01.id
#   virtual_network_id      = azurerm_virtual_network.vnet-adl-osr-nook.id
#   ip_address              = var.nic-d01-ip[count.index]
# }

# resource "azurerm_lb_backend_address_pool_address" "lb_backend_address_d03" {
#   count                   = 2
#   provider                = azurerm.spoke
#   depends_on              = [azurerm_lb_backend_address_pool.lb_backend_d03]
#   name                    = "adl-osr-nook-d03-${format("%03d", count.index + 1)}"
#   backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend_d03.id
#   virtual_network_id      = azurerm_virtual_network.vnet-adl-osr-nook.id
#   ip_address              = var.nic-d03-ip[count.index]
# }

# resource "azurerm_lb_rule" "lb_rule_d01" {
#   provider                       = azurerm.spoke
#   loadbalancer_id                = azurerm_lb.lb.id
#   name                           = "adl-osr-nook-d01"
#   protocol                       = "Tcp"
#   frontend_port                  = 80
#   backend_port                   = 9600
#   frontend_ip_configuration_name = azurerm_lb.lb.frontend_ip_configuration[0].name
#   backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb_backend_d01.id]
#   probe_id                       = azurerm_lb_probe.lb_probe_9600.id
# }

# resource "azurerm_lb_rule" "lb-rule-d03" {
#   provider                       = azurerm.spoke
#   loadbalancer_id                = azurerm_lb.lb.id
#   name                           = "adl-osr-nook-d03-port-8080-rule"
#   protocol                       = "Tcp"
#   frontend_port                  = 80
#   backend_port                   = 8080
#   frontend_ip_configuration_name = azurerm_lb.lb.frontend_ip_configuration[1].name
#   backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb_backend_d03.id]
#   probe_id                       = azurerm_lb_probe.lb_probe_8080.id
# }