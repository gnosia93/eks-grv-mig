module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name                    = local.cluster_name
  cluster_version                 = "1.31"
  cluster_endpoint_private_access = false
  cluster_endpoint_public_access  = true

 # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true


  bootstrap_self_managed_addons = false
  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["c6i.2xlarge", "c6g.2xlarge"]
  }

  eks_managed_node_groups = {
    ng-x86 = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["c6i.2xlarge"]

      min_size     = 3
      max_size     = 3
      desired_size = 3
    }
  }

  cloudwatch_log_group_retention_in_days = 1
}

# https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest

/*
Error: waiting for EKS Node Group (eks-grv-mig:ng-x86-20241209221503109200000015) create: unexpected state 'CREATE_FAILED', wanted target 'ACTIVE'. last error: i-05f04897353fc76af, i-08cea01975730272b, i-0e21b71b34065f19d: NodeCreationFailure: Instances failed to join the kubernetes cluster
│
│   with module.eks.module.eks_managed_node_group["ng-x86"].aws_eks_node_group.this[0],
│   on .terraform/modules/eks/modules/eks-managed-node-group/main.tf line 392, in resource "aws_eks_node_group" "this":
│  392: resource "aws_eks_node_group" "this" {

public subnet 에 NAT GW 를 설치하지 않고 cluster_endpoint_private_access = false 로 설정하여 클러스터를 생성하면
데이터 플래인과 컨트롤 플레인 간의 통신이 불가능하다. 이런 경우 위와 같은 생성 오류가 발생한다. (생성 과정에서 보통 15-20분 정도 시간이 흐른 후에 오류 발생)

해결방법:
  1. public 서브넷이 Nat gw 를 설치하거나,
  2. eks control plan 의 443 port 를 data plan security group 를 대상으로 해서 열어준다. 
*/

/*
https://seungjjun.tistory.com/314
*/


/*
https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html 
Cluster private endpoint

You can enable private access to the Kubernetes API server so that all communication between your nodes and the API server stays within your VPC. You can limit the IP addresses that can access your API server from the internet, or completely disable internet access to the API server.

Note
Because this endpoint is for the Kubernetes API server and not a traditional AWS PrivateLink endpoint for communicating with an AWS API, it doesn’t appear as an endpoint in the Amazon VPC console.

When you enable endpoint private access for your cluster, Amazon EKS creates a Route 53 private hosted zone on your behalf and associates it with your cluster’s VPC. This private hosted zone is managed by Amazon EKS, and it doesn’t appear in your account’s Route 53 resources. In order for the private hosted zone to properly route traffic to your API server, your VPC must have enableDnsHostnames and enableDnsSupport set to true, and the DHCP options set for your VPC must include AmazonProvidedDNS in its domain name servers list. For more information, see Updating DNS support for your VPC in the Amazon VPC User Guide.

You can define your API server endpoint access requirements when you create a new cluster, and you can update the API server endpoint access for a cluster at any time.
*/




