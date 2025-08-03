variable "nic_name" {
  description = "Name of the Network Interface"
  type        = string
  
}
variable "location" {
  description = "Location for the resources"
  type        = string
}
variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}
variable "subnet_id" {
  description = "ID of the Subnet"
  type        = string
}
variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
}
variable "vm_size" {
  description = "Size of the Virtual Machine"
  type        = string
}
variable "admin_username" {
  description = "Admin username for the Virtual Machine"
  type        = string
}
variable "admin_password" {
  description = "Admin password for the Virtual Machine"
  type        = string
  sensitive   = true
}
variable "image_publisher" {
  description = "Publisher of the OS image"
  type        = string
}
variable "image_offer" {
  description = "Offer of the OS image"
  type        = string
}
variable "image_sku" {
  description = "SKU of the OS image"
  type        = string
}
variable "image_version" {
  description = "Version of the OS image"
  type        = string
}