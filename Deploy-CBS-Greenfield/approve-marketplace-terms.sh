#terraform import "azurerm_marketplace_agreement.plan"  "/subscriptions/f4c99595-b139-4086-a00c-30da54ce80e9/providers/Microsoft.MarketplaceOrdering/agreements/purestoragemarketplaceadmin/offers/pure_storage_cloud_block_store_deployment/plans/cbs_azure_6_4_10"
#marketplace approval
terraform import "azurerm_marketplace_agreement.plan"  "/subscriptions/f4c99595-b139-4086-a00c-30da54ce80e9/providers/Microsoft.MarketplaceOrdering/agreements/purestoragemarketplaceadmin/offers/pure_storage_cloud_block_store_deployment/plans/cbs_azure_6_6_3"
terraform import "azurerm_marketplace_agreement.plan"  "/subscriptions/f4c99595-b139-4086-a00c-30da54ce80e9/providers/Microsoft.MarketplaceOrdering/agreements/purestoragemarketplaceadmin/offers/pure_storage_cloud_block_store_deployment/plans/cbs_azure_6_6_3"
# depennds on which release - copy and apply accordingly.
az vm image terms accept --offer pure_storage_cloud_block_store_deployment --plan cbs_azure_6_6_3 --publisher purestoragemarketplaceadmin
az vm image terms accept --offer pure_storage_cloud_block_store_deployment --plan cbs_azure_6_6_4 --publisher purestoragemarketplaceadmin
