environment          = "prod"
region               = "us-east-1"
instance_type        = "t2.micro"
vpc_cidr_block       = "10.1.0.0/16"
private_subnets_cidr = ["10.1.3.0/24", "10.1.4.0/24"]
public_subnets_cidr  = ["10.1.1.0/24", "10.1.2.0/24"]
key_name             = "ssh"
