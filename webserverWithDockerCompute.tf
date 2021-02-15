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
}
