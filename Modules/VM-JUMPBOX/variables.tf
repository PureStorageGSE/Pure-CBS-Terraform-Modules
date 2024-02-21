
variable "azure_vm_size" {
  type = string
}
variable "azure_vm_username" {
  type = string
}
variable "azure_vm_password" {
  type = string
}
variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "resource_group_location" {
  type        = string
  description = "RG location in Azure"
}

variable "tags" {
  type        = map(string)
  description = "Tags used for the deployment"
  default = {
    "Environment" = "Lab"
    "Owner"       = "CBS"
  }
}

variable "cbs_vnet_name" {
  type        = string
}

variable "cbs_subnet_vms_address" {
  type        = list(any)
  description = "the address space of the initior VMs subnet"
  default     = ["10.10.0.0/24"]
}
