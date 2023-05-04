terraform {
  backend "s3" {
    bucket = "terraform-sorour"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

# Your Terraform resources go here

module "networking" {
  source               = "./modules/networking"
  region               = var.region
  environment          = var.environment
  vpc_cidr_block       = var.vpc_cidr_block
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
}
resource "aws_db_instance" "mydb" {
  identifier          = var.db_instance_identifier
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t2.micro"
  allocated_storage   = var.db_allocated_storage
  name                = "mydb"
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true
}

resource "aws_elasticache_cluster" "mycache" {
  cluster_id           = var.cache_cluster_id
  engine               = "redis"
  node_type            = var.cache_node_type
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"
  engine_version       = "6.x"
  port                 = 6379
}
