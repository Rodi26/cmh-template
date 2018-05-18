#####################################################################
##
##      Created 3/13/18 by ucdpadmin. for multi-cloud-mysql-liberty
##
#####################################################################

# JKE Web Server IP address
output "web_server_ip_address" {
  value = "${aws_instance.web-server.public_ip}"
}
output "db_server_ip_address" {
  value = "${ibm_compute_vm_instance.db-server.ipv4_address}"
}

output "tls-private-key" {
  value = "${base64encode(tls_private_key.ssh.private_key_pem)}"
}
