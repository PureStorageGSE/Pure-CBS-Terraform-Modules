# Deploy CBS Into an Existing Azure Subscription with a specific resource group

By _Daniel Cave, Pure Storage, Global Services Engineering, March 2024_

## What does this code do

This terraform code will deploy a CBS Array into an existing Azure Resource Group which contains a Vnet and four subnets.

### If you want to route between your VNets from On Premise or another Azure subscription

Vis.


| ![](assets/20240320_122712_CBS-Generic-Two-RG-Deployment.png) |
| :-------------------------------------------------------------: |

For testing purposes we used a `/21` CIDR range for each separate vnet and setup Vnet peer routing to allow On premise traffic access the CBS array from the management network via a site to site VPN (via the Virtual Network Gateway). You may already have this connectivity in place using another connection

You may _also_ need to setup the Vnet peering between your managment and CBS vnet by uncommenting the Module CBS-VNet-Peering code in `main.tf` file on lines `144-152`, unless you have already done this. This will allow your users to access the CBS management network as well as the CBS iscsi subnet when allocating storage to the hosts using it.

The `Modules/CBS-VNet-Peering/main.tf`code has options to activate this which are commented out and setup the following traffic routing options in the Peering section in the Azure UI. Peering can be activated by uncommenting lines`15-17 & 27-30`


| ![](assets/Azure-Peer-To-CBS-UI.png) | ![](assets/Azure-Peer-From-CBS-UI.png) |
| :------------------------------------: | :--------------------------------------: |
|                                     |                                       |

## How to Use

1. Deploy an Azure VM into the same subscription where you are planning to deploy CBS
2. Identify and obtain the names of the following resources.

- a resource group that you have created for CBS
- a VNET and four subnets that you want to use for CBS. Namely, system, management, iscsi and replication

This code will deploy the dependencies and CBS Array into the VNet which you choose along with the VNet peering between the Vnets.

3. SSH to your deployment VM (in step 1) - ensure that you have Vnet peering setup between your separate Deployment RG/VNET and the CBS RG Vnet
4. Clone this repository - if you haven't already
5. Change to this directory `cd Deploy-CBS-Existing-Infra`
6. Edit the `terraform.tfvars` file and modify all the variables required on lines:

   - Resource group name and region location `lines 2,3`
   - Existing Resource Group Name and Vnet  `lines 6 & 8`
   - Azure Client, Subscription and Tennant details `lines 11-14`
   - Azure Jump box VM username and password `lines 24,25`
   - CBS Version to deploy "Aka Plan name" `line 27` **This should be the latest version of CBS**
7. Edit the `approve-marketplace-terms.sh` script if you're using a new version of CBS in Azure and/or with a different Azure account/subscription to approve the marketplace terms for CBS and to import that subscription plan into Terraform. This ensures that the Terraform knows about these items and can deploy the CBS array without errors. Save and exit :)
8. Run the `approve-marketplace-terms.sh` script. It should look like this:
[![asciicast](https://asciinema.org/a/VDyqiYIEnc3RPPiLDV4GnJ0wG.svg)](https://asciinema.org/a/VDyqiYIEnc3RPPiLDV4GnJ0wG) 


9. Run `terraform init ; terraform plan` to check what is going to be deployed
10. Deploy the CBS dependencies and array using `terraform apply --auto-approve` to run with out human confirmation.
11. Grab a coffee for ~30mins and check back to see if it's deployed
<!-- 
Here's one we deployed earlier !

![](https://asciinema.org/12356) -->
