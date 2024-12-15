module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = lower("${var.vpc[terraform.workspace].name}-${terraform.workspace}")

  cidr               = var.vpc[terraform.workspace].cidr_block
  enable_dns_support = var.vpc[terraform.workspace].enable_dns

  azs             = [for i in var.subnet[terraform.workspace].multi_az : i]
  private_subnets = [for i in var.subnet[terraform.workspace].private.cidr_block : i]
  public_subnets  = [for i in var.subnet[terraform.workspace].public.cidr_block : i]

  enable_nat_gateway      = var.vpc[terraform.workspace].nat
  enable_vpn_gateway      = var.vpc[terraform.workspace].vpn
  map_public_ip_on_launch = var.subnet[terraform.workspace].public.pip_on_launch

  public_subnet_tags = {
    "kubernetes.io/role/elb" = var.subnet[terraform.workspace].public.public_elb
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = var.subnet[terraform.workspace].private.internal_elb
  }

  tags = {
    TERRAFORM   = lower("true")
    ENVIRONMENT = lower(terraform.workspace)
    PRODUCT     = "infra-network"
  }
}
