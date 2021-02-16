#TerraformOracleNetwork

#To Run perform these actions 
terraform init
terraform plan
terraform apply

#Description:
This script will create
1. A bastion host in public subnet (I am using normal ubuntu compute instance as bastion host , in real time we can use a hardened bastion machine with more security).Bastion host will connect on 22 from all machine in internet , for more security we can allow access to this host from a specific network Range.
2. Compute instance on private subnet (10.0.3.0/24) which can be accessed by the bastion host over port 22 (subnet range 10.0.1.0/24) , and port 8080 from traffic coming from load balancer subnet (10.0.2.0/24).
3. A VPC with CIDR 10.0.0.0/16.
4. A Load Balancer connecting to instances in Private subnet (10.0.3.0/24.

#Issues needs to be addreseed
1. I have commented out the bootstarp script as that was taking long.Will explain during the interview.
2. I am using Sydney zone which has only 1 AD so not able to make this higly available.
3. Not able to create server for Grafana.

#High Availablity Solution:
1. Create two public subnets for 2 load balancers in two seperate ADs.
2. Create two public subnet to host 2 Bastion host in 2 seperate AD so if 1 AD goes doem we have another bastion host.
3. Weservers or DB instances needs to be launched in multiple private Subnet in different ADs.
