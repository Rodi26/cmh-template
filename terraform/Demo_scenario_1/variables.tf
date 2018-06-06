#####################################################################
##
##      Created 5/18/18 by ucdpadmin. for Demo_scenario_1
##
#####################################################################

variable "ibm_bmx_api_key" {
  type = "string"
  description = "Generated"
}

variable "ibm_sl_username" {
  type = "string"
  description = "Generated"
}

variable "ibm_sl_api_key" {
  type = "string"
  description = "Generated"
}



variable "server-web_hostname" {
  type = "string"
  description = "The hostname for the computing instance."
}



variable "server-web_os_reference_code" {
  type = "string"
  description = "Generated"
}

variable "server-domain" {
  type = "string"
  description = "The domain for the computing instance."
}

variable "server-db_hostname" {
  type = "string"
  description = "The hostname for the computing instance."
}

variable "server-datacenter" {
  type = "string"
  description = "The datacenter in which you want to provision the instance. NOTE: If dedicated_host_name or dedicated_host_id is provided then the datacenter should be same as the dedicated host datacenter."
}

variable "server-db_os_reference_code" {
  type = "string"
  description = "Generated"
}

variable "_public_vlan_id" {
  type = "string"
  description = "Generated"
}

variable "_private_vlan_id" {
  type = "string"
  description = "Generated"
}

