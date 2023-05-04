variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets_cidr" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnets_cidr" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}
variable "db_instance_identifier" {
  description = "RDS instance identifier"
  type        = string
}

variable "db_username" {
  description = "RDS instance master username"
  type        = string
}

variable "db_password" {
  description = "RDS instance master password"
  type        = string
  sensitive   = true
}

variable "db_allocated_storage" {
  description = "RDS instance allocated storage in GB"
  type        = number
}

variable "cache_cluster_id" {
  description = "ElastiCache cluster ID"
  type        = string
}

variable "cache_node_type" {
  description = "ElastiCache node type"
  type        = string
}
