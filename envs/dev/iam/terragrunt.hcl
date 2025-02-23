terraform {
  source = "git::https://github.com/Silva4g/RFM-Technical-interview-terraform.git//iam?ref=v1"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  role_name = "dev-cluster-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
  policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  ]
}
