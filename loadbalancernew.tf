resource "oci_load_balancer_load_balancer" "pub_lb" {
  compartment_id = var.compartment_ocid
  display_name   = "LoadbalancerOracle"
  shape          = "100Mbps"
  subnet_ids     = [oci_core_subnet.vcn-public-subnet-loadBalancer.id]

  is_private                 = false
}

resource "oci_load_balancer_backend_set" "ingress_controller" {
  load_balancer_id = oci_load_balancer_load_balancer.pub_lb.id
  name             = "fibonacci_set"

  health_checker {
    interval_ms         = 10000
    port                = 8080
    protocol            = "HTTP"
    response_body_regex = ".*"
    url_path            = "/3"
  }

  policy = "ROUND_ROBIN"

  
}

resource "oci_load_balancer_listener" "http_listener" {
  load_balancer_id         = oci_load_balancer_load_balancer.pub_lb.id
  name                     = "fibonacciListener"
  default_backend_set_name = oci_load_balancer_backend_set.ingress_controller.name
  port                     = 80
  protocol                 = "HTTP"
}


resource "oci_load_balancer_backend" "fibonacciLBBackend" {
    #Required
    backendset_name = oci_load_balancer_backend_set.ingress_controller.name
    ip_address = oci_core_instance.ubuntu_instance_webserver.private_ip
    load_balancer_id = oci_load_balancer_load_balancer.pub_lb.id
    port = "8080"

}
