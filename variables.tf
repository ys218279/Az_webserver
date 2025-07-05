# Project-wide variables

variable "location" {
  description = "Azure region to deploy recources into"
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-webserver-dev"
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "youness"
    project     = "webserver"
  }

}

variable "object_id" {
  description = "object_id for my user"
  type = string
}

# Key-vault variables

variable "kv_allowed_ip" {
  description = "Allowed ips that can access the Key vault"
  type        = list(string)
}

variable "allowed_ssh_ip" {
  description = "ip addresses allowed to SSH into jumpbox"
  type        = list(string)
}

