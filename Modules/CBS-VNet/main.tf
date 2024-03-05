

# resource "azurerm_virtual_network" "cbs_virtual_network" {
#   name                = format("%s%s%s", var.resource_group_name, var.resource_group_location, "-VNET")
#   location            = var.resource_group_location
#   resource_group_name = var.resource_group_name
#   address_space       = var.vnet_address_space
#   tags                = var.tags
# }

#  Use existing PS-ENG Vnet

data "azurerm_virtual_network" "PS_ENG_VNET" {
  name                = "gse-ps-lab-vnet-192.168.176.0-20"
  resource_group_name = "ps_engineering_resource_group"
}

#outputs as
# cbs_vnet_id = data.azurerm_virtual_network.PS_ENG_VNET.id

resource "azurerm_subnet" "subnet" {
  for_each = var.subnets
  # resource_group_name  = var.resource_group_name
  resource_group_name = data.azurerm_virtual_network.PS_ENG_VNET.resource_group_name
  # virtual_network_name = azurerm_virtual_network.cbs_virtual_network.name
  virtual_network_name = data.azurerm_virtual_network.PS_ENG_VNET.name
#  name                 = format("%s%s%s", var.resource_group_name, var.resource_group_location, each.value["name"])
  name                 = format("%s%s", var.resource_group_name, each.value["name"])
  address_prefixes     = each.value["address_prefixes"]
  service_endpoints    = each.value["name"] == "cbs_subnet_sys" ? ["Microsoft.AzureCosmosDB", "Microsoft.KeyVault"] : []
}
