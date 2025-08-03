variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "example-network"
}
variable "virtual_network_location" {
  description = "Location of the virtual network"
  type        = string
  default     = "West Europe"
}
variable "resource_group_name" {
  description = "Name of the resource group where the virtual network will be created"
  type        = string
}
variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}