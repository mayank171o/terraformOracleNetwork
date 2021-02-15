module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "2.0.0"
# Required
  compartment_id = var.compartment_ocid
  region = var.region
  vcn_name = "oracleInterview-VCN"
  vcn_dns_label = "forOracle"

  # Optional
  internet_gateway_enabled = true
  nat_gateway_enabled = true
  service_gateway_enabled = true
  vcn_cidr = "10.0.0.0/16"

}
