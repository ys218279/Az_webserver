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


#variable "ssh_public_key" {
#  description = "Public key for SSH access"
#  type        = string
#  # You’ll pass in the ssh_public_key using a .tfvars file or CLI (not hardcoded).
#}
