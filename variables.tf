# Project-wide variables

variable "location" {
  description = "Azure region to deploy recources into"
  type = string
  default = "westeurope"
}

variable "resource_group_name" {
    description = "Name of the resource group"
    type = string
    default = "rg-webserver-dev"
}

variable "tags" {
    description = "Common resource tags"
    type = map(string)
    default = {
      environment = "dev"
      owner = "youness"
      project = "webserver"
    }
  
}

# Networking Variables

variable "vnet_name" {
  description = "Name of the Virtual network"
  type = string
  default = "vnet-webserver-dev"
  
}

variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
  default     = "subnet-webserver-dev"
}

variable "address_space" {
  description = "IP range for Vnet"
  type = list(string)
  default = [ "10.0.0.0/16" ]  
}

variable "subnet_prefix" {
  description = "IP range for subnet"
  type = string
  default = "10.0.1.0/24"
}


# Subnet for Jump Box
variable "jumpbox_subnet_name" {
  description = "Name of the subnet for the jump box"
  type        = string
  default     = "jumpbox-subnet"
}

variable "jumpbox_subnet_prefix" {
  description = "IP range for the jump box subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "jumpbox_nsg_name" {
  description = "Name of the NSG for the jump box"
  type = string
  default = "nsg-jumpbox"
}
variable "allowed_ssh_ip" {
  description = "Public IP address allowed for SSH"
  type = string
  default = "185.237.63.73/24"
}

# Jump Box Admin Settings
variable "admin_username" {
  description = "Username for SSH access to the VM"
  type        = string
  default     = "azureuser"
}
variable "ssh_public_key" {
  description = "Public key for SSH access"
  type        = string
  # You’ll pass in the ssh_public_key using a .tfvars file or CLI (not hardcoded).
}
