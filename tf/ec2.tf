module "ec2_instance_x86" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  for_each = toset(["jenk-x86", "prome", "nexus3"])

  name = "i-${each.key}"

  instance_type          = "c6i.xlarge"
  key_name               = var.key_pair
  monitoring             = true
  vpc_security_group_ids = [module.ec2_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  associate_public_ip_address	= "true" 

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ec2_instance_arm" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "i-jenk-arm"

  instance_type          = "c6g.2xlarge"
  key_name               = var.key_pair
  monitoring             = true
  vpc_security_group_ids = [module.ec2_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  associate_public_ip_address	= "true" 

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


# public_subnets
# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest?tab=outputs
# https://library.tf/modules/terraform-aws-modules/ec2-instance/aws/latest
