locals {

}


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.4"
  providers = {
    aws = aws.dev
  }
  azs                             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  cidr                            = "10.0.0.0/16"
  public_subnets                  = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
  database_subnets                = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
  private_subnets                 = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  create_database_subnet_group    = true
  create_egress_only_igw          = true
  create_elasticache_subnet_group = true
  create_igw                      = true
  create_redshift_subnet_group    = false
  create_vpc                      = true
  database_subnet_group_name      = "rnd-db-sg-${terraform.workspace}"
  database_subnet_group_tags = {
    Environment = terraform.workspace
  }
  database_subnet_tags = {
    Environment = terraform.workspace
  }
  default_network_acl_name = "rnd-nacl-${terraform.workspace}"
  default_network_acl_tags = {
    Environment = terraform.workspace
  }
  default_route_table_name = "rnd-rt-${terraform.workspace}"
  default_route_table_tags = {
    Environment = terraform.workspace
  }
  default_security_group_name = ""
  default_security_group_tags = {
    Environment = terraform.workspace
  }
  default_vpc_name = "Default-VPC-${terraform.workspace}"
  igw_tags = {
    Environment = terraform.workspace
  }
  name = "rnd-vpc-${terraform.workspace}"
  private_subnet_tags = {
    Environment = terraform.workspace
  }
  public_acl_tags = {
    Environment = terraform.workspace
  }
  public_route_table_tags = {
    Environment = terraform.workspace
  }
  public_subnet_tags = {
    Environment = terraform.workspace
  }
  vpc_tags = {
    Environment = terraform.workspace
  }
}