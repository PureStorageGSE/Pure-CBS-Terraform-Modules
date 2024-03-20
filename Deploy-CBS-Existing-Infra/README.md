# Deploy CBS Into an Existing Azure Subscription with a specific resource group

## What does this code do

This terraform code will deploy a CBS Array into an existing Azure Resource Group which contains a Vnet and four subnets.


### If you want to route between your VNets from On Premise or another Azure subscription

You may need to setup the Vnet peering between your managment and CBS vnet by uncommenting the Module CBS-VNet-Peering code in `main.tf` file on lines `144-152`, unless you have already done this.

The Modules/CBS-VNet-Peering  `main.tf` code has options to activate this which are commented out and follow the four traffic routing options in the Peering section in the Azure UI. These can be used by uncommenting lines `15-17 & 27-30`

Vis.


![](assets/20240320_122712_CBS-Generic-Two-RG-Deployment.png)


## How to Use

1. Deploy an Azure VM into the same subscription where you are planning to deploy CBS
2. Identify and obtain the names of the following resources.

- a resource group that you have created for CBS
- a VNET and four subnets that you want to use for CBS. Namely, system, management, iscsi and replication

This code will deploy the dependencies and CBS Array into the VNet which you choose along with the VNet peering between the Vnets.

We used a /21 for each separate vnet
