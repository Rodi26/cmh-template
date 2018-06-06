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
}

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
}

resource "ibm_compute_ssh_key" "ibm_cloud_temp_public_key" {
  label = "ibm-cloud-temp-public-key"
  ## public_key_e = "${tls_private_key.ssh.public_key_openssh}"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC96CaESwiS3NgQirjMB3V6hy8vJp2YTc3yJ62PzZRuctJ73mJHNbUBiJ60CY3fc1G6+rFkwMrCa2NDb4Lcpff1lOshRhL/Ev9e/YirTEjsdB305NmONlzHkIXnnyyTeD/7TZMokMtYY8b0Q8e5xZ64Pdo6DewTDSXRRex9DaeWZCMfUiJVqcaOYPNmipA9tAKLvQnFF5Cf0BaFxz066G2tODPZt/XWm2s3y7kO0E0ohLHn/Vk8vDVp/1XRimyo32l7/euSLLFSSsk4LXavZYztCScyhpZdU4K1C05L82xAI23ODAe07Plech7TRvu3J+CTpTKSNFDsuOSMgzn0Sjpt rodolphefontaine@mbp-de-rodolphe.boiscolombes.fr.ibm.com"
  
}