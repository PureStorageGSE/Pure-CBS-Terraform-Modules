#Azure Variables

resource_group_name     = "gse-ps-cbs-azure-lab-" #Prefix for Jump Start Deployment Resources
resource_group_location = "eastus"              #Region see entries below

use_vnet = var.existing_virtual_network_name

# azure_client_id                       = "xxxxxxxx-xxxx-xxx-xxxx-xxxxxxxxxxxxxx"
# azure_client_secret                   = "xxxxxxxx-xxxx-xxx-xxxx-xxxxxxxxxxxxxx"
# azure_subscription_id                 = "xxxxxxxx-xxxx-xxx-xxxx-xxxxxxxxxxxxxx"
# azure_tenant_id                       = "xxxxxxxx-xxxx-xxx-xxxx-xxxxxxxxxxxxxx"

#test comment to see if i can push
#test comment to see if i can push
azure_client_id                       = "520b379a-46f5-4713-8460-d2823bd39226"
azure_client_secret                   = "2~98Q~zYZR6gINf2wd54MBlIIue4zsuFh8ck0buZ"
azure_subscription_id                 = "f4c99595-b139-4086-a00c-30da54ce80e9"
azure_tenant_id                       = "5a3d1859-f4b7-4151-beae-773895b989fd"

azure_vm_size     = "Standard_B1s"
azure_vm_username = "pureuser"
azure_vm_password = "F0mFx1Klp0ksQFEfkZX"

plan_name = "cbs_azure_6_6_4" #specify CBS Version 6.1.11 and 6.2.1 are the latest.
#plan_name = "cbs_azure_6_4_10" #specify CBS Version 6.1.11 and 6.2.1 are the latest.
plan_product = "pure_storage_cloud_block_store_deployment" #Sspecify CBS Version
plan_publisher = "purestoragemarketplaceadmin" #specify CBS Version
plan_version = "1.0.1" #specify CBS Version

#vnet_address_space = ["192.168.176.0/20"]
#cbs_vnet_id="fda4585c-8500-42f7-b783-d847b019a5b8"
# id
#cbs_vnet_id="11353c73-369d-4d4d-bcb5-17ef55e71fe0"


subnets = {
  cbs_subnet_mgmt = {
    name             = "cbs_subnet_mgmt"
    address_prefixes = ["192.168.184.0/24"]
  }
  cbs_subnet_iscsi = {
    name             = "cbs_subnet_iscsi"
    address_prefixes = ["192.168.185.0/24"]
  }
  cbs_subnet_repl = {
    name             = "cbs_subnet_repl"
    address_prefixes = ["192.168.186.0/24"]
  }
  cbs_subnet_sys = {
    name             = "cbs_subnet_sys"
    address_prefixes = ["192.168.187.0/24"]
  }
}

cbs_subnet_vms_address = ["192.168.188.0/24"]

tags = {
  "Environment" = "Lab"
  "Owner"       = "CBS"
}

#CBS Array Name
array_name = "CBS-Greenfield-GSE-PS-lab"


#CBS License key from Pure1
license_key = "CBS-TRIAL-LICENSE"
#DNS Domain for Array
log_sender_domain = "purestorage.com"
#Email for Alerts
alert_recipients = ["global-ps-services-engineering@purestorage.com"]
#Azure Zone
zone = 1
#Array Model ## Choose from (V10MUR1, V20MUR1, V20MP2R2)
array_model = "V10MUR1"

azure_virtualnetwork_peer_name = "ps_engineering_vnet-192.168.176.0-21"
azure_virtualnetwork_peer_rg = "ps_engineering_resource_group"

#Azure AD Group for JIT Approval
jit_group_ids = ["eef91524-9f5e-4063-a10f-227270959da7"]
#Private key file path for pureuser
#key_file_path = "/home/azureuser/.ssh/gse-ps-cbs-docs-test-array_rsa"
key_file_path = "./gse-ps-cbs-docs-test-array_rsa"
