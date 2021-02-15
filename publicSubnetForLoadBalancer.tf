
# Source from https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_subnet

resource "oci_core_subnet" "vcn-public-subnet-loadBalancer"{

  # Required
  compartment_id = var.compartment_ocid
  vcn_id = module.vcn.vcn_id
  cidr_block = "10.0.2.0/24"
 
  # Optional
  route_table_id = module.vcn.ig_route_id
  security_list_ids = [oci_core_security_list.public-security-list-loadbalancer.id]
  display_name = "public-subnet-loadBalancer"
}

