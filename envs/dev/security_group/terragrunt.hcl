terraform {
  source = "git::https://github.com/Silva4g/RFM-Technical-interview-terraform.git//sg?ref=v1.2"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

dependency "network" {
  config_path = "../network"
}

inputs = {
  sg_name             = "dev-eks-sg"
  vpc_id              = dependency.network.outputs.vpc_id
  ingress_from_port   = 443
  ingress_to_port     = 443
  ingress_protocol    = "tcp"
  ingress_cidr_blocks = ["0.0.0.0/0"]
  tags = {
    Environment = "dev"
    Project     = "security-group"
  }
}