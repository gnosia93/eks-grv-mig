module "ec2_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "user-service"
  vpc_id      = module.vpc.vpc_id

  egress_cidr_blocks = ["0.0.0.0/0"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8090
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {  
      rule        = "ssh-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  

}
# https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest
