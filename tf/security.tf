module "ec2_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "user-service"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks      = ["10.10.0.0/16", "0.0.0.0/0"]
  ingress_rules            = ["ssh-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8090
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = ["10.10.0.0/16", "0.0.0.0/0"]
    },
  ]
}
# https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest
