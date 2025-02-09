terraform {
  source = "git::https://github.com/Silva4g/RFM-Technical-interview-terraform.git//terraform/modules/eks?ref=v1"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  sg_name             = "dev-eks-sg"
  vpc_id              = "vpc-xyz123"
  ingress_from_port   = 443
  ingress_to_port     = 443
  ingress_protocol    = "tcp"
  ingress_cidr_blocks = ["0.0.0.0/0"]
  tags = {
    Environment = "dev"
    Project     = "security-group"
  }
}
