terraform {
  source = "git::https://github.com/Silva4g/RFM-Technical-interview-terraform.git//eks?ref=v1.1"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

dependency "network" {
  config_path = "../network"

  mock_outputs = {
    vpc_id             = "vpc-xyz123"
    public_subnet_ids  = ["subnet-abc123", "subnet-def456"]
    private_subnet_ids = ["subnet-ghi789", "subnet-jkl012"]
  }
}

dependency "security_group" {
  config_path = "../security_group"

  mock_outputs = {
    sg_id = "sg-xyz123"
  }
}

dependency "iam" {
  config_path = "../iam"

  mock_outputs = {
    role_arn = "arn:aws:iam::123456789012:role/mock-role"
  }
}

inputs = {
  cluster_name            = "dev-cluster"
  cluster_role_arn        = dependency.iam.outputs.role_arn
  node_role_arn           = dependency.iam.outputs.role_arn
  subnet_ids              = dependency.network.outputs.public_subnet_ids
  security_group_id       = dependency.security_group.outputs.sg_id
  node_group_desired_size = 2
  node_group_min_size     = 1
  node_group_max_size     = 3
  instance_types          = ["t3.medium"]
  tags = {
    Environment = "dev"
    Project     = "eks"
  }
}
