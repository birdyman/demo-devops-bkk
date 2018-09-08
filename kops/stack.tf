##########################
#         VPC value      #
##########################

resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name        = "${var.vpc_name}"
    Environment = "${var.vpc_env}"
    Owner       = "${var.vpc_owner}"
  }
}

output "vpc_id" {
  value = "\"${aws_vpc.vpc.id}\""
}

output "vpc_cidr" {
  value = "\"${aws_vpc.vpc.cidr_block}\""
}

#################################
#         Internet Gateway      #
#################################
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.tag_internet_gateway_name}"
    Environment = "${var.tag_internet_gateway_env}"
  }
}

output "igw_id" {
  value = "\"${aws_internet_gateway.internet_gateway.id}\""
}


#####################
#       Subnet      #
#####################

####################Subnet Frontend####################

resource "aws_subnet" "subnet_fe_1a" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.subnet_fe_1a_cidr}"
  availability_zone = "ap-southeast-1a"

  tags {
    Name        = "${var.subnet_fe_1a_name}"
    Environment = "${var.subnet_fe_1a_env}"
    Tier        = "${var.subnet_fe_1a_tier}"
  }
}

resource "aws_subnet" "subnet_fe_1b" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.subnet_fe_1b_cidr}"
  availability_zone = "ap-southeast-1b"

  tags {
    Name        = "${var.subnet_fe_1b_name}"
    Environment = "${var.subnet_fe_1b_env}"
    Tier        = "${var.subnet_fe_1b_tier}"
  }
}

resource "aws_subnet" "subnet_fe_1c" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.subnet_fe_1c_cidr}"
  availability_zone = "ap-southeast-1c"

  tags {
    Name        = "${var.subnet_fe_1c_name}"
    Environment = "${var.subnet_fe_1c_env}"
    Tier        = "${var.subnet_fe_1c_tier}"
  }
}

####################Subnet Backend####################

resource "aws_subnet" "subnet_be_1a" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.subnet_be_1a_cidr}"
  availability_zone = "ap-southeast-1a"

  tags {
    Name        = "${var.subnet_be_1a_name}"
    Environment = "${var.subnet_be_1a_env}"
    Tier        = "${var.subnet_be_1a_tier}"
  }
}

resource "aws_subnet" "subnet_be_1b" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.subnet_be_1b_cidr}"
  availability_zone = "ap-southeast-1b"

  tags {
    Name        = "${var.subnet_be_1b_name}"
    Environment = "${var.subnet_be_1b_env}"
    Tier        = "${var.subnet_be_1b_tier}"
  }
}

resource "aws_subnet" "subnet_be_1c" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.subnet_be_1c_cidr}"
  availability_zone = "ap-southeast-1c"

  tags {
    Name        = "${var.subnet_be_1c_name}"
    Environment = "${var.subnet_be_1c_env}"
    Tier        = "${var.subnet_be_1c_tier}"
  }
}
####################Subnet Database####################

resource "aws_subnet" "subnet_db_1a" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.subnet_db_1a_cidr}"
  availability_zone = "ap-southeast-1a"

  tags {
    Name        = "${var.subnet_db_1a_name}"
    Environment = "${var.subnet_db_1a_env}"
    Tier        = "${var.subnet_db_1a_tier}"
  }
}

resource "aws_subnet" "subnet_db_1b" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.subnet_db_1b_cidr}"
  availability_zone = "ap-southeast-1b"

  tags {
    Name        = "${var.subnet_db_1b_name}"
    Environment = "${var.subnet_db_1b_env}"
    Tier        = "${var.subnet_db_1b_tier}"
  }
}

resource "aws_subnet" "subnet_db_1c" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.subnet_db_1c_cidr}"
  availability_zone = "ap-southeast-1c"

  tags {
    Name        = "${var.subnet_db_1c_name}"
    Environment = "${var.subnet_db_1c_env}"
    Tier        = "${var.subnet_db_1c_tier}"
  }
}

####################Subnet DMZ####################

resource "aws_subnet" "subnet_dz_1a" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.subnet_dz_1a_cidr}"
  availability_zone = "ap-southeast-1a"

  tags {
    Name        = "${var.subnet_dz_1a_name}"
    Environment = "${var.subnet_dz_1a_env}"
    Tier        = "${var.subnet_dz_1a_tier}"
  }
}

resource "aws_subnet" "subnet_dz_1b" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.subnet_dz_1b_cidr}"
  availability_zone = "ap-southeast-1b"

  tags {
    Name        = "${var.subnet_dz_1b_name}"
    Environment = "${var.subnet_dz_1b_env}"
    Tier        = "${var.subnet_dz_1b_tier}"
  }
}

resource "aws_subnet" "subnet_dz_1c" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.subnet_dz_1c_cidr}"
  availability_zone = "ap-southeast-1c"

  tags {
    Name        = "${var.subnet_dz_1c_name}"
    Environment = "${var.subnet_dz_1c_env}"
    Tier        = "${var.subnet_dz_1c_tier}"
  }
}

##########################################################

output "subnet_fe_1a_id" {
  value = "\"${aws_subnet.subnet_fe_1a.id}\""
}

output "subnet_fe_1b_id" {
  value = "\"${aws_subnet.subnet_fe_1b.id}\""
}

output "subnet_fe_1c_id" {
  value = "\"${aws_subnet.subnet_fe_1c.id}\""
}

output "subnet_be_1a_id" {
  value = "\"${aws_subnet.subnet_be_1a.id}\""
}

output "subnet_be_1b_id" {
  value = "\"${aws_subnet.subnet_be_1b.id}\""
}

output "subnet_be_1c_id" {
  value = "\"${aws_subnet.subnet_be_1c.id}\""
}

output "subnet_db_1a_id" {
  value = "\"${aws_subnet.subnet_db_1a.id}\""
}

output "subnet_db_1b_id" {
  value = "\"${aws_subnet.subnet_db_1b.id}\""
}

output "subnet_db_1c_id" {
  value = "\"${aws_subnet.subnet_db_1c.id}\""
}

output "subnet_dz_1a_id" {
  value = "\"${aws_subnet.subnet_dz_1a.id}\""
}

output "subnet_dz_1b_id" {
  value = "\"${aws_subnet.subnet_dz_1b.id}\""
}

output "subnet_dz_1c_id" {
  value = "\"${aws_subnet.subnet_dz_1c.id}\""
}

output "subnet_fe_1a_cidr_block" {
  value = "\"${aws_subnet.subnet_fe_1a.cidr_block}\""
}

output "subnet_fe_1b_cidr_block" {
  value = "\"${aws_subnet.subnet_fe_1b.cidr_block}\""
}

output "subnet_fe_1c_cidr_block" {
  value = "\"${aws_subnet.subnet_fe_1c.cidr_block}\""
}

output "subnet_be_1a_cidr_block" {
  value = "\"${aws_subnet.subnet_be_1a.cidr_block}\""
}

output "subnet_be_1b_cidr_block" {
  value = "\"${aws_subnet.subnet_be_1b.cidr_block}\""
}

output "subnet_be_1c_cidr_block" {
  value = "\"${aws_subnet.subnet_be_1c.cidr_block}\""
}

output "subnet_db_1a_cidr_block" {
  value = "\"${aws_subnet.subnet_db_1a.cidr_block}\""
}

output "subnet_db_1b_cidr_block" {
  value = "\"${aws_subnet.subnet_db_1b.cidr_block}\""
}

output "subnet_db_1c_cidr_block" {
  value = "\"${aws_subnet.subnet_db_1c.cidr_block}\""
}

output "subnet_dz_1a_cidr_block" {
  value = "\"${aws_subnet.subnet_dz_1a.cidr_block}\""
}

output "subnet_dz_1b_cidr_block" {
  value = "\"${aws_subnet.subnet_dz_1b.cidr_block}\""
}

output "subnet_dz_1c_cidr_block" {
  value = "\"${aws_subnet.subnet_dz_1c.cidr_block}\""
}


#####################
#       NetGW      #
#####################

resource "aws_eip" "nat_gw" {
  vpc = true

  tags {
    Name        = "${var.tag_eip_vpn_name}"
    Environment = "${var.tag_eip_vpn_env}"
    Service     = "${var.tag_eip_vpn_service}"
  }
}

resource "aws_nat_gateway" "gw" {
  allocation_id = "${aws_eip.nat_gw.id}"
  subnet_id     = "${aws_subnet.subnet_dz_1a.id}"

  tags {
    Name        = "${var.nat_gw_name}"
    Environment = "${var.tag_env}"
    Service     = "${var.tag_service}"
  }
}

##########################################################################

output "nat_gateway_id" {
  value = "\"${aws_nat_gateway.gw.id}\""
}

##################
#       R53      #
##################

#resource "aws_route53_zone" "zone" {
#  name   = "${var.zone_name}"
#  vpc_id = "\"${aws_vpc.vpc.id}\""
#}

#output "zone_id" {
#  value = "\"${aws_route53_zone.zone.id}\""
#}


###############################
#    Routing Table Private    #
###############################


# Creating route table private zone A

resource "aws_route_table" "route_table_private_1a" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = "${var.cidr_block_rtb_private}"
    nat_gateway_id = "${aws_nat_gateway.gw.id}"
  }

  tags {
    Name       = "${var.tag_routetable_private_name_1a}"
    Environmet = "${var.tag_routetable_private_env}"

  }
}

resource "aws_route_table_association" "route_table_association_private_be_1a" {
  subnet_id      = "${aws_subnet.subnet_be_1a.id}"
  route_table_id = "${aws_route_table.route_table_private_1a.id}"
}

resource "aws_route_table_association" "route_table_association_private_fe_1a" {
  subnet_id      = "${aws_subnet.subnet_fe_1a.id}"
  route_table_id = "${aws_route_table.route_table_private_1a.id}"
}

resource "aws_route_table_association" "route_table_association_private_db_1a" {
  subnet_id      = "${aws_subnet.subnet_db_1a.id}"
  route_table_id = "${aws_route_table.route_table_private_1a.id}"
}
#################################################################################

# Creating route table private zone B

resource "aws_route_table" "route_table_private_1b" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = "${var.cidr_block_rtb_private}"
    nat_gateway_id = "${aws_nat_gateway.gw.id}"
  }

  tags {
    Name       = "${var.tag_routetable_private_name_1b}"
    Environmet = "${var.tag_routetable_private_env}"

  }
}

resource "aws_route_table_association" "route_table_association_private_be_1b" {
  subnet_id      = "${aws_subnet.subnet_be_1b.id}"
  route_table_id = "${aws_route_table.route_table_private_1b.id}"
}

resource "aws_route_table_association" "route_table_association_private_fe_1b" {
  subnet_id      = "${aws_subnet.subnet_fe_1b.id}"
  route_table_id = "${aws_route_table.route_table_private_1b.id}"
}

resource "aws_route_table_association" "route_table_association_private_db_1b" {
  subnet_id      = "${aws_subnet.subnet_db_1b.id}"
  route_table_id = "${aws_route_table.route_table_private_1b.id}"
}

#################################################################################

# Creating route table private zone C

resource "aws_route_table" "route_table_private_1c" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = "${var.cidr_block_rtb_private}"
    nat_gateway_id = "${aws_nat_gateway.gw.id}"
  }

  tags {
    Name       = "${var.tag_routetable_private_name_1c}"
    Environmet = "${var.tag_routetable_private_env}"

  }
}

resource "aws_route_table_association" "route_table_association_private_be_1c" {
  subnet_id      = "${aws_subnet.subnet_be_1c.id}"
  route_table_id = "${aws_route_table.route_table_private_1c.id}"
}

resource "aws_route_table_association" "route_table_association_private_fe_1c" {
  subnet_id      = "${aws_subnet.subnet_fe_1c.id}"
  route_table_id = "${aws_route_table.route_table_private_1c.id}"
}

resource "aws_route_table_association" "route_table_association_private_db_1c" {
  subnet_id      = "${aws_subnet.subnet_db_1c.id}"
  route_table_id = "${aws_route_table.route_table_private_1c.id}"
}

#################################################################################

output "routetable_private_1a_id" {
  value = "\"${aws_route_table.route_table_private_1a.id}\""
}

output "routetable_private_1b_id" {
  value = "\"${aws_route_table.route_table_private_1b.id}\""
}

output "routetable_private_1c_id" {
  value = "\"${aws_route_table.route_table_private_1c.id}\""
}

##############################
#    Routing Table Public    #
##############################

# Creating route table public ZONE A
resource "aws_route_table" "route_table_public_1a" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "${var.cidr_block_rtb_public}"
    gateway_id = "${aws_internet_gateway.internet_gateway.id}"
  }

  tags {
    Name       = "${var.tag_routetable_public_1a}"
    Environmet = "${var.tag_routetable_public_env}"
  }
}

resource "aws_route_table_association" "route_table_association_public_dz_1a" {
  subnet_id      = "${aws_subnet.subnet_dz_1a.id}"
  route_table_id = "${aws_route_table.route_table_public_1a.id}"
}
#################################################################################
# Creating route table public ZONE B
resource "aws_route_table" "route_table_public_1b" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "${var.cidr_block_rtb_public}"
    gateway_id = "${aws_internet_gateway.internet_gateway.id}"
  }

  tags {
    Name       = "${var.tag_routetable_public_1b}"
    Environmet = "${var.tag_routetable_public_env}"
  }
}

resource "aws_route_table_association" "route_table_association_public_dz_1b" {
  subnet_id      = "${aws_subnet.subnet_dz_1b.id}"
  route_table_id = "${aws_route_table.route_table_public_1b.id}"
}
#################################################################################
# Creating route table public ZONE C
resource "aws_route_table" "route_table_public_1c" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "${var.cidr_block_rtb_public}"
    gateway_id = "${aws_internet_gateway.internet_gateway.id}"
  }

  tags {
    Name       = "${var.tag_routetable_public_1c}"
    Environmet = "${var.tag_routetable_public_env}"
  }
}

resource "aws_route_table_association" "route_table_association_public_dz_1c" {
  subnet_id      = "${aws_subnet.subnet_dz_1c.id}"
  route_table_id = "${aws_route_table.route_table_public_1c.id}"
}

#################################################################################

output "routetable_public_1a_id" {
  value = "\"${aws_route_table.route_table_public_1a.id}\""
}

output "routetable_public_1b_id" {
  value = "\"${aws_route_table.route_table_public_1b.id}\""
}

output "routetable_public_1c_id" {
  value = "\"${aws_route_table.route_table_public_1c.id}\""
}