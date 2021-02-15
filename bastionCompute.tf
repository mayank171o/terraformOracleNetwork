resource "oci_core_instance" "ubuntu_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = var.compartment_ocid
    shape = "VM.Standard.E2.1"
    source_details {
        source_id = "ocid1.image.oc1.ap-sydney-1.aaaaaaaapvxndzsvdpmp6voysj4c337qsecv3vhh7o7wstoq4k3koo4ha3iq"
        source_type = "image"
    }

    # Optional
    display_name = "myUbuntu-bastion"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = oci_core_subnet.vcn-public-subnet-jumpServer.id
    }
    metadata = {
        ssh_authorized_keys = file(var.publickeyCompute)
    } 
    preserve_boot_volume = false
   connection {
    type        = "ssh"
    host        = "${self.public_ip}"
    user        = "ubuntu"
    private_key = file("/home/mayank/tf-compartment/keys")
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
