variable "sql_server_name" {
  description = "The name of the SQL Server"
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which the SQL Server should exist"
  type        = string
  
}
variable "location" {
  description = "The Azure Region where the SQL Server should exist"
  type        = string
  
}
variable "administrator_login" {
  description = "The administrator login for the SQL Server"
  type        = string
}
variable "administrator_login_password" {
  description = "The password for the SQL Server administrator login"
  type        = string
  sensitive   = true
}