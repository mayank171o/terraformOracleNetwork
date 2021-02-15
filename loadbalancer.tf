resource "oci_load_balancer_load_balancer" "LoadbalancerOracle" {
    #Required
    compartment_id = var.compartment_ocid
    display_name = "LoadbalancerOracle"
    shape = "100Mbps"
    subnet_ids = [oci_core_subnet.vcn-public-subnet-loadBalancer.id]

}
resource "oci_load_balancer_backend" "oracleBackendLB" {
    #Required
    backendset_name = oci_load_balancer_backend_set.oracleBackendLB_set.name
    ip_address = oci_core_instance.ubuntu_instance_webserver.private_ip
    load_balancer_id = oci_load_balancer_load_balancer.LoadbalancerOracle.id
    port = "80"

}
resource "oci_load_balancer_listener" "oracle_lb_listener" {
    #Required
    default_backend_set_name = oci_load_balancer_backend_set.oracleBackendLB_set.name
    load_balancer_id = oci_load_balancer_load_balancer.LoadbalancerOracle.id
    name = "oracle_lb_listener"
    port = "80"
    protocol = "HTTP"
}

resource "oci_load_balancer_backend_set" "oracleBackendLB_set" {
    #Required
    health_checker {
        #Required
        protocol ="HTTP"
        url_path = "/"

    }
    load_balancer_id = oci_load_balancer_load_balancer.LoadbalancerOracle.id
    name = "oracleBackendLB_set"
    policy = "LEAST_CONNECTIONS"


    }

