# Creating the VPC

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}


#Creating an Internet Gateway

resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        Name = "${var.project_name}-igw"
    }  
}


# Use data source to get all availability zones in region

data "aws_availability_zones" "available_zones" {}


#Creating public subnet az1

resource "aws_subnet" "pb_sn_az1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.pb_sn_az1_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "pb_sn_az1"
  }
}


# Creating public subnet az2

resource "aws_subnet" "pb_sn_az2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.pb_sn_az2_cidr
  availability_zone =  data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "pb_sn_az2"
  }
}


# Creating public subnet az3

resource "aws_subnet" "pb_sn_az3" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.pb_sn_az3_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[2]
  map_public_ip_on_launch = true

  tags = {
    Name = "pb_sn_az3"
  }
}


# Creating route table and add public route

resource "aws_route_table" "pb_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "public route table"
  }
}


#======================================================================
#       PUBLIC ROUTE TABLE ASSOCIATION WITH PUBLIC SUBNETS

# associate pb-sn-az1 with the "public route table"

resource "aws_route_table_association" "pb_sn_az1_rt_assoc" {
  subnet_id = aws_subnet.pb_sn_az1.id
  route_table_id = aws_route_table.pb_rt.id
}


# associate pb-sn-az2 with the "public route table"

resource "aws_route_table_association" "pb_sn_az2_rt_assoc" {
  subnet_id = aws_subnet.pb_sn_az2.id
  route_table_id = aws_route_table.pb_rt.id
}

# associate pb-sn-az3 with the "public route table"

resource "aws_route_table_association" "pb_sn_az3_rt_assoc" {
  subnet_id = aws_subnet.pb_sn_az3.id
  route_table_id = aws_route_table.pb_rt.id
}

#========================================================================




# CREATING PRIVATE SUBNETS
#--------------------------------------------

# create private app subnet az1
resource "aws_subnet" "pvt_sn_az1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.pvt_sn_az1_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "private app subnet az1"
  }
}

# create private app subnet az2
resource "aws_subnet" "pvt_sn_az2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.pvt_sn_az2_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "private app subnet az2"
  }
}

# create private app subnet az3
resource "aws_subnet" "pvt_sn_az3" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.pvt_sn_az3_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[2]
  map_public_ip_on_launch = false

  tags = {
    Name = "private app subnet az3"
  }
}


# create private db subnet az1
resource "aws_subnet" "pvt_db_az1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.pvt_db_az1_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "private db subnet az1"
  }
}

#create private db subnet az2
resource "aws_subnet" "pvt_db_az2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.pvt_db_az2_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "private db subnet az2"
  }
}

# create private db subnet az3
resource "aws_subnet" "pvt_db_az3" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.pvt_db_az3_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[2]
  map_public_ip_on_launch = false

  tags = {
    Name = "private db subnet az3"
  }
}

