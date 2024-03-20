
// setup network peering for access from your CBS deployment vnet to cbs vnet
 data "azurerm_virtual_network" "tf_vnet" {
   name                     = var.azure_virtualnetwork_peer_name
   resource_group_name      = var.azure_virtualnetwork_peer_rg
}

// Configure two way peering from management vnet to cbs vnet
resource "azurerm_virtual_network_peering" "tf_cbs" {
  name                      = "To-CBS-VNET"
  resource_group_name       = var.azure_virtualnetwork_peer_rg
  virtual_network_name      = data.azurerm_virtual_network.tf_vnet.name
  remote_virtual_network_id = var.cbs_vnet_id
  #  configure routing between vnets
  # allow_forwarded_traffic = true
  # allow_virtual_network_access = true
  # allow_gateway_transit = true
}

// Configure two way peering back from CBS Net to management Vnet
resource "azurerm_virtual_network_peering" "cbs_tf" {
  name                      = "From-CBS-VNET"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.cbs_vnet_name
  remote_virtual_network_id = data.azurerm_virtual_network.tf_vnet.id
  # configure routing between vnets
  # allow_forwarded_traffic = true
  # allow_virtual_network_access = true
  # allow_gateway_transit = true
  # use_remote_gateways = true

}
