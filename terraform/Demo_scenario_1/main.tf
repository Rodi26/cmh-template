#####################################################################
##
##      Created 5/18/18 by ucdpadmin. for Demo_scenario_1
##
#####################################################################

## REFERENCE {"ibm_network":{"type": "ibm_reference_network"}}

terraform {
  required_version = "> 0.8.0"
}

provider "ibm" {
  bluemix_api_key    = "${var.ibm_bmx_api_key}"
  softlayer_username = "${var.ibm_sl_username}"
  softlayer_api_key  = "${var.ibm_sl_api_key}"
  version = "~> 0.7"
}


resource "ibm_compute_vm_instance" "server-web" {
  cores       = 1
  memory      = 1024
  domain      = "${var.server-domain}"
  hostname    = "${var.server-web_hostname}"
  datacenter  = "${var.server-datacenter}"
  ssh_key_ids = ["${ibm_compute_ssh_key.ibm_cloud_temp_public_key.id}"]
  os_reference_code = "${var.server-web_os_reference_code}"
  private_security_group_ids = ["${var.group_name_private_id}"]
  public_vlan_id       = "${var._public_vlan_id}"
  private_vlan_id       = "${var._private_vlan_id}"
}

resource "ibm_compute_vm_instance" "server-db" {
  cores       = 1
  memory      = 1024
  domain      = "${var.server-domain}"
  hostname    = "${var.server-db_hostname}"
  datacenter  = "${var.server-datacenter}"
  ssh_key_ids = ["${ibm_compute_ssh_key.ibm_cloud_temp_public_key.id}"]
  os_reference_code = "${var.server-db_os_reference_code}"
  public_vlan_id       = "${var._public_vlan_id}"
  private_vlan_id       = "${var._private_vlan_id}"
  private_security_group_ids = ["${var.group_name_private_id}"]
}

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
}

resource "ibm_compute_ssh_key" "ibm_cloud_temp_public_key" {
  label = "ibm-cloud-temp-public-key"
  public_key = "${tls_private_key.ssh.public_key_openssh}"
}