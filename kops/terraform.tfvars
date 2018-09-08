########################
#       Provider       #
########################
region      = "ap-southeast-1"
access_key  = ""
secret_key  = ""
###################
#       VPC       #
###################

vpc_name = "demo-k8s-dev"
vpc_env = "dev"
vpc_owner = "dmeo" 
vpc_cidr = "172.16.0.0/16"

##############################
#          Internet GW       #
##############################

tag_internet_gateway_name = "nonprod-igw"
tag_internet_gateway_env = "nonprod"

##############################
#          Subnet CIDR       #
##############################

subnet_fe_1a_cidr = "172.16.51.0/24"
subnet_fe_1b_cidr = "172.16.55.0/24"
subnet_fe_1c_cidr = "172.16.59.0/24"

subnet_be_1a_cidr = "172.16.52.0/24"
subnet_be_1b_cidr = "172.16.56.0/24"
subnet_be_1c_cidr = "172.16.60.0/24"

subnet_db_1a_cidr = "172.16.53.0/24"
subnet_db_1b_cidr = "172.16.57.0/24"
subnet_db_1c_cidr = "172.16.61.0/24"

subnet_dz_1a_cidr = "172.16.50.0/24"
subnet_dz_1b_cidr = "172.16.54.0/24"
subnet_dz_1c_cidr = "172.16.58.0/24"

##############################
#          Subnet Name       #
##############################

subnet_fe_1a_name = "nonprod-subnet-fe-1a"
subnet_fe_1b_name = "nonprod-subnet-fe-1b"
subnet_fe_1c_name = "nonprod-subnet-fe-1c"

subnet_be_1a_name = "nonprod-subnet-be-1a"
subnet_be_1b_name = "nonprod-subnet-be-1b"
subnet_be_1c_name = "nonprod-subnet-be-1c"

subnet_db_1a_name = "nonprod-subnet-db-1a"
subnet_db_1b_name = "nonprod-subnet-db-1b"
subnet_db_1c_name = "nonprod-subnet-db-1c"

subnet_dz_1a_name = "nonprod-subnet-dz-1a"
subnet_dz_1b_name = "nonprod-subnet-dz-1b"
subnet_dz_1c_name = "nonprod-subnet-dz-1c"

##############################
#          Subnet Tags       #
##############################

subnet_fe_1a_env = "nonprod"
subnet_fe_1b_env = "nonprod"
subnet_fe_1c_env = "nonprod"

subnet_be_1a_env = "nonprod"
subnet_be_1b_env = "nonprod"
subnet_be_1c_env = "nonprod"

subnet_db_1a_env = "nonprod"
subnet_db_1b_env = "nonprod"
subnet_db_1c_env = "nonprod"

subnet_dz_1a_env = "nonprod"
subnet_dz_1b_env = "nonprod"
subnet_dz_1c_env = "nonprod"

subnet_fe_1a_tier = "frontend"
subnet_fe_1b_tier = "frontend"
subnet_fe_1c_tier = "frontend"

subnet_be_1a_tier = "backend"
subnet_be_1b_tier = "backend"
subnet_be_1c_tier = "backend"

subnet_db_1a_tier = "database"
subnet_db_1b_tier = "database"
subnet_db_1c_tier = "database"

subnet_dz_1a_tier = "dmz"
subnet_dz_1b_tier = "dmz"
subnet_dz_1c_tier = "dmz"



###################
#      NatGW      #
###################


nat_gw_name = "nonprod-ngw-1a"
tag_service = "nat"
tag_env = "nonprod"

tag_eip_vpn_name = "nonprod-ngw-eip"
tag_eip_vpn_env = "nonprod"
tag_eip_vpn_service = "eip"

#################
#      R53      #
#################

zone_name = "nonprod.demo.cloud"

#############################
#      Routing Private      #
#############################
cidr_block_rtb_private = "0.0.0.0/0"
tag_routetable_private_name_1a = "nonprod-rtb-private-1a"
tag_routetable_private_name_1b = "nonprod-rtb-private-1b"
tag_routetable_private_name_1c = "nonprod-rtb-private-1c"
tag_routetable_private_env = "nonprod"


############################
#      Routing Public      #
############################

tag_routetable_public_1a     = "nonprod-rtb-public-1a"
tag_routetable_public_1b     = "nonprod-rtb-public-1b"
tag_routetable_public_1c     = "nonprod-rtb-public-1c"
tag_routetable_public_env = "nonprod"
cidr_block_rtb_public = "0.0.0.0/0"

###############
# EC2 ALL TAG #
###############

server_name = "kops-nonprod"
sg_ec2_name = "kops-nonprod-sg"
policy_name = "kops-nonprod-policy"
role_name = "kops-nonprod-role"
profile_name = "kops-nonprod-profile"
attach_name = "kops-nonprod-attach"

tag_service = "kops"
tag_env = "nonprod"
tag_component = "k8s"

policy_description = "kops-nonprod-policy"
sg_ec2_description = "Security group for kops-nonprod"

policy_description = "kops-nonprod-policy"
sg_ec2_description = "Security group for kops-nonprod"

instances = "1"
app_ami = "ami-01da99628f381e50a"
instance_type = "t3.micro"
availability_zone_a = "ap-southeast-1a"
key_pair_name = "demo-k8s"
volume_type = "gp2"
volume_size = "50"
delete_on_termination = "false"

r53_pv_name = "kops-nonprod"
r53_domain_name = "nonprod.demo.cloud"
r53_type_a = "A"
r53_ttl = "60"
route53_private_id = ""