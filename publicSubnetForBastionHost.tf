
# Source from https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_subnet

resource "oci_core_subnet" "vcn-public-subnet-jumpServer"{

  # Required
  compartment_id = var.compartment_ocid
  vcn_id = module.vcn.vcn_id
  cidr_block = "10.0.1.0/24"
 
  # Optional
  route_table_id = module.vcn.ig_route_id
  security_list_ids = [oci_core_security_list.public-security-list-bastion-host.id]
  display_name = "public-subnet-BastionHost"
}

