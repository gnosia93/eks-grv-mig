data "aws_ami" "ubuntu-arm" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu-pro-server/images/hvm-ssd-gp3/ubuntu-noble-24.04-arm64-pro-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "ubuntu-x86" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu-pro-server/images/hvm-ssd/ubuntu-jammy-22.04-amd64-pro-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "ec2_instance_x86" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  for_each = toset(["jenk", "prome", "nexus3"])

  name = "x86-${each.key}"

  instance_type          = "c6i.xlarge"
  ami                    = data.aws_ami.ubuntu-x86.id
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

  name = "arm-jenk"

  instance_type          = "c6g.2xlarge"
  ami                    = data.aws_ami.ubuntu-arm.id
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

# ami finder - https://hoonii2.tistory.com/31

# public_subnets
# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest?tab=outputs
# https://library.tf/modules/terraform-aws-modules/ec2-instance/aws/latest
