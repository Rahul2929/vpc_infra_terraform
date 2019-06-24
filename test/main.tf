provider "aws" {
        region                  = "ap-south-1"
        shared_credentials_file = "/home/user/.aws/credentials"
        profile                 = "default"
}


module "test_vpc" {
        source      = "../modules/vpc"
        vpc_tag     = "test_vpc"
        availability_zone = "ap-south-1a"
}


module "networking" {
	source  	= "../modules/network"
	vpc_id		= "${module.test_vpc.vpc_id}"
	subnet_id	= flatten("${module.test_vpc.subnet_id}")	
}

module "security" {
	source		= "../modules/securityGroup"
        vpc_id		= "${module.test_vpc.vpc_id}"
        public_subnet_cidr   = "${module.test_vpc.subnets}"
}

module "test_ec2" {
        source    = "../modules/ec2"
        subnet_id = flatten("${module.test_vpc.subnet_id}")
	availability_zone = "ap-south-1a"
        securitygroup  = ["${module.security.sgweb}", "${module.security.sgdb}"]
}

