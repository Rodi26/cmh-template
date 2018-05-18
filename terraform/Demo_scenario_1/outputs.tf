#####################################################################
##
##      Created 5/18/18 by ucdpadmin. for Demo_scenario_1
##
#####################################################################

output "db_server_ip_address" {
  value = "${ibm_compute_vm_instance.server-db.ipv4_address}"
}

output "db_web_ip_address" {
  value = "${ibm_compute_vm_instance.server-web.ipv4_address}"
}