#####################################################################
##
##      Created 4/6/18 by ucdpadmin. for simple-test-1
##
#####################################################################

terraform {
  required_version = "> 0.8.0"
}

#provider "aws" {
#  access_key = "${var.aws_access_id}"
#  secret_key = "${var.aws_secret_key}"
#  region     = "${var.region}"
#  version = "~> 1.8"
#}


resource "aws_instance" "aws_instance" {
  ami = "ami-06c4cb11"
  key_name = "${aws_key_pair.auth.id}"
  instance_type = "t2.small"
  availability_zone = "${var.availability_zone}"
  tags {
    Name = "${var.aws_instance_name}"
  }
}

resource "tls_private_key" "ssh" {
    algorithm = "RSA"
}

resource "aws_key_pair" "auth" {
    key_name = "test-cam-key-${random_pet.env_id.id}"
    public_key = "${tls_private_key.ssh.public_key_openssh}"
}

# Random string to use for environment and agent names
resource "random_pet" "env_id" {
}

##############################################################
# Install Java
##############################################################
resource "null_resource" "test-cam-provider" {
  # Specify the ssh connection
  connection {
    user = "ubuntu"
    private_key = "${tls_private_key.ssh.private_key_pem}"
    host = "${aws_instance.aws_instance.public_ip}"
  }

  # Create the installation script
  provisioner "file" {
    content = <<EOF
#!/bin/bash
echo 'sleeping to test cam.....'
sleep 300
echo 'awake'
EOF

    destination = "/tmp/install_java.sh"
  }

  # Execute the script remotely
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install_java.sh; sudo bash /tmp/install_java.sh",
    ]
  }
}