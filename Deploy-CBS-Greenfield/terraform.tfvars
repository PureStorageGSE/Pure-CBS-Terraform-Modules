
#Azure Variables
resource_group_name     = "cbs-modules-prereq-" #Prefix for Jump Start Deployment Resources
resource_group_location = "eastus"              #Region see entries below
# azure_client_id                       = "xxxxxxxx-xxxx-xxx-xxxx-xxxxxxxxxxxxxx"
# azure_client_secret                   = "xxxxxxxx-xxxx-xxx-xxxx-xxxxxxxxxxxxxx"
# azure_subscription_id                 = "xxxxxxxx-xxxx-xxx-xxxx-xxxxxxxxxxxxxx"
# azure_tenant_id                       = "xxxxxxxx-xxxx-xxx-xxxx-xxxxxxxxxxxxxx"
azure_vm_size     = "Standard_B1s"
azure_vm_username = "xxxxxxxxxx"
azure_vm_password = "xxxxxxxx"

vnet_address_space = ["10.10.0.0/16"]

subnets = {
  cbs_subnet_mgmt = {
    name             = "cbs_subnet_mgmt"
    address_prefixes = ["10.10.1.0/24"]
  }
  cbs_subnet_iscsi = {
    name             = "cbs_subnet_iscsi"
    address_prefixes = ["10.10.2.0/24"]
  }
  cbs_subnet_repl = {
    name             = "cbs_subnet_repl"
    address_prefixes = ["10.10.3.0/24"]
  }
  cbs_subnet_sys = {
    name             = "cbs_subnet_sys"
    address_prefixes = ["10.10.4.0/24"]
  }
}

cbs_subnet_vms_address = ["10.10.5.0/24"]

tags = {
  "Environment" = "Lab"
  "Owner"       = "CBS"
}

#CBS Array Name
array_name = "CBS-Greenfiled"


#CBS License key from Pure1
license_key = "xxxxxxxxxxxxxxxxxxxxxxxxxx"
#DNS Domain for Array
log_sender_domain = "xxxxxxx.com"
#Email for Alerts
alert_recipients = ["xxxxxxxx@xxxxxxxx.com"]
#Azure Zone                  
zone = 1
#Array Model ## Choose from (V10MUR1, V20MUR1, V20MP2R2)                                           
array_model = "V10MUR1"

azure_virtualnetwork_peer_name = "xxxxxx"
azure_virtualnetwork_peer_rg   = "xxxxxx"

#Azure AD Group for JIT Approval
jit_group_ids = ["xxxxxxxxxxxxxxx"]
# key file path for pureuser
key_file_path = "~/.ssh/xxxxx" 