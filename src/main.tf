module "eks_cluster" {
  source = "../modules/cluster"

  project_name = "${var.project_name}-${terraform.workspace}"
  subnet_ids   = module.vpc.public_subnets[*]
  tags         = local.tags

}

module "managed_node_group" {
  source = "../modules/managed-node-group"

  project_name = "${var.project_name}-${terraform.workspace}"
  cluster_name = module.eks_cluster.cluster_name
  subnet_ids   = module.vpc.private_subnets[*]
  tags         = local.tags
}

module "load_balancer_controller" {
  source = "../modules/load-balancer-controller"

  project_name = "${var.project_name}-${terraform.workspace}"
  cluster_name = module.eks_cluster.cluster_name
  oidc         = module.eks_cluster.oidc
  tags         = local.tags
}