environment          = "dev"
region               = "us-east-1"
instance_type        = "t2.micro"
vpc_cidr_block       = "10.0.0.0/16"
public_subnets_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets_cidr = ["10.0.3.0/24", "10.0.4.0/24"]
