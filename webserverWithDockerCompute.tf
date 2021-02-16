resource "oci_core_instance" "ubuntu_instance_webserver" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = var.compartment_ocid
    shape = "VM.Standard.E2.1"
    source_details {
        source_id = "ocid1.image.oc1.ap-sydney-1.aaaaaaaapvxndzsvdpmp6voysj4c337qsecv3vhh7o7wstoq4k3koo4ha3iq"
        source_type = "image"
    }

    # Optional
    display_name = "myUbuntu-webserver"
    create_vnic_details {
        assign_public_ip = false
        subnet_id = oci_core_subnet.vcn-private-subnet-WebServer.id
    }
    metadata = {
        ssh_authorized_keys = file(var.publickeyCompute)
    } 
    preserve_boot_volume = false
	
	connection  {
    type        = "ssh"
    host        = "${self.private_ip}"
    timeout     = "5m"
    user        = "ubuntu"
    private_key = file(var.privatekeyCompute)

    bastion_host        = oci_core_instance.ubuntu_instance.public_ip
    bastion_user        = "ubuntu"
    bastion_private_key = file(var.privatekeyCompute)
  }
 provisioner "file" {
    source      = "script/setup.sh"
    destination = "~/setup.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sh ~/setup.sh",
    ]
  }
}
