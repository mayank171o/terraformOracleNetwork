#TerraformOracleNetwork

##To Run perform these actions 
terraform init
terraform plan
terraform apply

##Description:
This script will create
	1. A bastion host in public subnet (I am using normal ubuntu compute instance as bastion host , in real time we can use a hardened bastion machine with more security , also I used the basion host in same compartment under same same subnet , as per the challenge bastion must be on a different compartment with different subnet id starting from 172.x.x.x)).
	Bastion host will connect on 22 from all machine in internet , for more security we can allow access to this host from a specific network Range.
	2. Compute instance on private subnet (10.0.3.0/24) which can be accessed by the bastion host over port 22 (subnet range 10.0.1.0/24) , and port 8080 from traffic coming from load balancer subnet (10.0.2.0/24).
	3. Compute instance in public subnet containing running graffana and promethius docker images. Prometheus will monitor and store state of out fibonacci service and graffana will display it.
	4. A VPC with CIDR 10.0.0.0/16.
	5. A Load Balancer connecting to instances in Private subnet 10.0.3.0/24.

#Accessing Application
	1. Fibonacci service: http://<loadbalancerIP>/{length} ex( http://40.12.32.12/5 )
	2. Prometheus: http://<publicIP of Grafana compute instance>:9090. Please visit  http://<publicIP of Grafana compute instance>:9090/targets  to see the health status of the fibonacci service. In query box enter metrics http_server_requests_seconds_count to get number of hits per second on fibonaci service.
	3. Grafana: http://<publicIP of Grafana compute instance>:3000 ex (http://140.238.197.191:3000)
	   Steps:
	    - Username/Password : admin/admin
		- Default datasource is Prometheus I have configured this in datasource.yml file under scripts.
		- create new Dashboard
		- Create new Panel , under promethius select metrics as UP , this will display the fibonacci service status (up or down)
		- Create new Panel , under promethius select metrics put promhttp_metric_handler_requests_total to get number of hits on the application.

##High Availablity Solution:
1. Create two public subnets for 2 load balancers in two seperate ADs.
2. Create two public subnet to host 2 Bastion host in 2 seperate AD so if 1 AD goes doem we have another bastion host.
3. Weservers or DB instances needs to be launched in multiple private Subnet in different ADs. 
