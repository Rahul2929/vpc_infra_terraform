provider "aws" {
        region                  = "ap-south-1"
        shared_credentials_file = "/home/user/.aws/credentials"
        profile                 = "default"
}


module "test_vpc" {
        source      = "./modules/vpc"
	vpc_cidr    = "${var.vpc_cidr}"
        vpc_tag     = "${var.vpc_tag}"
        availability_zone = "ap-south-1a"
	subnet_cidrs = "${var.subnet_cidrs}"
}


module "networking" {
	source  	= "./modules/network"
	vpc_id		= "${module.test_vpc.vpc_id}"
	subnet_id	= flatten("${module.test_vpc.subnet_id}")	
}

module "security" {
	source		= "./modules/securityGroup"
        vpc_id		= "${module.test_vpc.vpc_id}"
        public_subnet_cidr   = "${var.subnet_cidrs}"
}

module "test_ec2" {
        source    = "./modules/ec2"
        subnet_id = flatten("${module.test_vpc.subnet_id}")
	availability_zone = "ap-south-1a"
        securitygroup  = ["${module.security.sgweb}", "${module.security.sgdb}"]
}

