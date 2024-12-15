module "ec2_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "eks-grv-mig-sg"
  vpc_id      = module.vpc.vpc_id
  use_name_prefix = false

#  ingress_cidr_blocks = local.all_ingress_ciders
#  ingress_rules       = ["http-8080-tcp"]

  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 9090
      protocol    = "tcp"
      cidr_blocks = [var.your_ip_cidr]
#      cidr_blocks = [ var.your_ip_cidr, var.github_webhook_ips ]
#      prefix_list_ids = [ "pl-e1a54088" ]
    },
    {  
      rule        = "ssh-tcp"
      cidr_blocks = var.your_ip_cidr
#      prefix_list_ids = [ "pl-e1a54088" ]
    },
  ]
  
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "All traffic"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  

}
# https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest
