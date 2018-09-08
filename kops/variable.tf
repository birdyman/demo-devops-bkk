#         static value      #

variable "region" {}
variable "access_key" {}
variable "secret_key" {}

#   VPC   #
variable "vpc_name" {}
variable "vpc_env" {}
variable "vpc_cidr" {}
variable "vpc_owner" {}

#   IGW   #
variable "tag_internet_gateway_name" {}
variable "tag_internet_gateway_env" {}


#   SUBNET   #
variable "subnet_fe_1a_cidr" {}
variable "subnet_fe_1b_cidr" {}
variable "subnet_fe_1c_cidr" {}
variable "subnet_be_1a_cidr" {}
variable "subnet_be_1b_cidr" {}
variable "subnet_be_1c_cidr" {}
variable "subnet_db_1a_cidr" {}
variable "subnet_db_1b_cidr" {}
variable "subnet_db_1c_cidr" {}
variable "subnet_dz_1a_cidr" {}
variable "subnet_dz_1b_cidr" {}
variable "subnet_dz_1c_cidr" {}
variable "subnet_fe_1a_name" {}
variable "subnet_fe_1b_name" {}
variable "subnet_fe_1c_name" {}
variable "subnet_be_1a_name" {}
variable "subnet_be_1b_name" {}
variable "subnet_be_1c_name" {}
variable "subnet_db_1a_name" {}
variable "subnet_db_1b_name" {}
variable "subnet_db_1c_name" {}
variable "subnet_dz_1a_name" {}
variable "subnet_dz_1b_name" {}
variable "subnet_dz_1c_name" {}
variable "subnet_fe_1a_env" {}
variable "subnet_fe_1b_env" {}
variable "subnet_fe_1c_env" {}
variable "subnet_be_1a_env" {}
variable "subnet_be_1b_env" {}
variable "subnet_be_1c_env" {}
variable "subnet_db_1a_env" {}
variable "subnet_db_1b_env" {}
variable "subnet_db_1c_env" {}
variable "subnet_dz_1a_env" {}
variable "subnet_dz_1b_env" {}
variable "subnet_dz_1c_env" {}
variable "subnet_fe_1a_tier" {}
variable "subnet_fe_1b_tier" {}
variable "subnet_fe_1c_tier" {}
variable "subnet_be_1a_tier" {}
variable "subnet_be_1b_tier" {}
variable "subnet_be_1c_tier" {}
variable "subnet_db_1a_tier" {}
variable "subnet_db_1b_tier" {}
variable "subnet_db_1c_tier" {}
variable "subnet_dz_1a_tier" {}
variable "subnet_dz_1b_tier" {}
variable "subnet_dz_1c_tier" {}

#   NatGW   #
variable "nat_gw_name" {}
variable "tag_eip_vpn_name" {}
variable "tag_eip_vpn_env" {}
variable "tag_eip_vpn_service" {}

#   r53   #
variable "zone_name" {}

#   Routing Private   #
variable "cidr_block_rtb_private" {}
variable "tag_routetable_private_name_1a" {}
variable "tag_routetable_private_name_1b" {}
variable "tag_routetable_private_name_1c" {}
variable "tag_routetable_private_env" {}

#   Routing Public   #
variable "tag_routetable_public_1a" {}
variable "tag_routetable_public_1b" {}
variable "tag_routetable_public_1c" {}
variable "tag_routetable_public_env" {}
variable "cidr_block_rtb_public" {}

#   EC2 information   #
variable "server_name" {}
variable "sg_ec2_name" {}
variable "policy_name" {}
variable "role_name" {}
variable "profile_name" {}
variable "attach_name" {}
variable "tag_service" {}
variable "tag_env" {}
variable "tag_component" {}

variable "policy_description" {}
variable "sg_ec2_description" {}

variable "instances" {}
variable "app_ami" {}
variable "instance_type" {}
variable "availability_zone_a" {}
variable "key_pair_name" {}
variable "volume_type" {}
variable "volume_size" {}
variable "delete_on_termination" {}

variable "r53_pv_name" {}
variable "r53_domain_name" {}
variable "r53_type_a" {}
variable "r53_ttl" {}
variable "route53_private_id" {}