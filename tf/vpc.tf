provider "aws" {
  region = "ap-northeast-2"
}

locals {
  cluster_name = "eks-grav-mig"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${local.cluster_name}"
  cidr = "10.0.0.0/16"

  azs             = ["ap-northeast-2b", "ap-northeast-2c"]
  private_subnets = ["10.0.0.0/22", "10.0.4.0/22"]
  public_subnets  = ["10.0.100.0/22", "10.0.104.0/22"]

  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
