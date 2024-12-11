module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name                    = local.cluster_name
  cluster_version                 = "1.31"

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  # addon 구성 
  cluster_addons = {
    coredns                 = { most_recent = true }
    kube-proxy              = { most_recent = true }
    vpc-cni                 = { most_recent = true }
    eks-pod-identity-agent  = { most_recent = true }
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    ng-x86 = {
      name             = "ng-x86"
      use_name_prefix	 = "false"
      ami_type         = "AL2023_x86_64_STANDARD"
      instance_types   = ["c6i.2xlarge"]

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }

/*
    ng-arm = {
      name             = "ng-arm"
      use_name_prefix	 = "false"
      ami_type         = "AL2023_ARM_64_STANDARD"
      instance_types   = ["c6g.2xlarge"]

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }
*/

  }
}

# https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest




