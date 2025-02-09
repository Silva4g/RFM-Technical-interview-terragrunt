terraform {
  source = "git::https://github.com/Silva4g/RFM-Technical-interview-terraform.git//network?ref=v1.2"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  azs                  = ["us-east-1a", "us-east-1b"]
  environment          = "dev"
  tags = {
    Environment = "dev"
    Project     = "network"
  }
}
