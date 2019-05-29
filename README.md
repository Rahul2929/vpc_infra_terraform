This repo helps to build vpc infrastructure in AWS with the help of terraform modules.

<B> DESCRIPTION </B>

		Repo helps in building below AWS services
		----------------------------------------- 
-> Spin up a VPC in ap-south-1a AZ, can be modified at runtime.

-> Create's 2 subnet one public one private in dividing vpc into two equal halfs.

-> Create IGw which is associated with public subnet

-> Create 2 EC2 instance ( frontend & backend ), frontend being in Public whereas backend being in Private subnet.

-> Create 2 SecurityGroup one for each frontend and backend ec2 instance 

<B> PREREQUISITE </B>

-> AWS account

-> ACCESS KEY & SECRET KEY for your account present in credentials file inside your $HOME/.aws directory. 

<B> RUN </B>

-> Set $TF_VAR_subnet_cidr value as a list.

   EXAMPLE: export $TF_VAR_subnet_cidr = '["192.168.0.0/25", "192.168.0.128/25"]'

-> Navigate to test folder and run below command
   
   RUN "terraform init"
   
   RUN "terraform apply"
