terraform {
  source = "git::https://github.com/Silva4g/RFM-Technical-interview-terraform.git//terraform/modules/eks?ref=v1"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  cluster_name            = "dev-cluster"
  cluster_role_arn        = dependency.iam.outputs.role_arn
  node_role_arn           = dependency.iam.outputs.role_arn
  subnet_ids              = ["subnet-abc123", "subnet-def456"]
  node_group_desired_size = 2
  node_group_min_size     = 1
  node_group_max_size     = 3
  instance_types          = ["t3.medium"]
  tags = {
    Environment = "dev"
    Project     = "eks"
  }
}
