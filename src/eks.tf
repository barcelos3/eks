module "eks_cluster" {
  source        = "../modules/cluster"

  project_name  = "${var.project_name}-${terraform.workspace}"
  subnet_ids    = module.vpc.public_subnets[*]
  tags          = local.tags

}

module "managed_node_group" {
  source       = "../modules/managed-node-group"

  node_group_name = "${var.project_name}-${terraform.workspace}"
  cluster_name    = module.eks_cluster.cluster_name
  subnet_ids      = module.vpc.private_subnets[*]
  tags            = local.tags
}