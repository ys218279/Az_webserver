terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.4.0"
}

# Configure the AzureRM provider to use CLI authentication
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}


# -------------------------------------------
# Create Virtual Network
# -------------------------------------------

resource "azurerm_virtual_network" "main" {
  name = var.vnet_name
  resource_group_name = azurerm_resource_group.main.name
  location = var.location
  address_space = var.address_space
  tags = var.tags
}

resource "azurerm_subnet" "main" {
  name = var.subnet_name
  resource_group_name = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes = [var.subnet_prefix]
}
# -------------------------------------------
# Jump Box Subnet
# -------------------------------------------

resource "azurerm_subnet" "jumpbox" {
  name                 = var.jumpbox_subnet_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.jumpbox_subnet_prefix]
}