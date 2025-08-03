resource "azurerm_public_ip" "Pip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = var.allocation_method
  }

variable "public_ip_name" {
  description = "The name of the public IP address."
  type        = string
  
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the public IP address."
  type        = string
}
variable "resource_group_location" {
  description = "The location of the resource group in which to create the public IP address."
  type        = string
}
variable "allocation_method" {
  description = "The allocation method for the public IP address. Can be 'Static' or 'Dynamic'."
  type        = string
  default     = "Static"
}