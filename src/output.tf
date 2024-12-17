output "security_group_ids" {
  description = "value of the security group ids"
  value       = aws_security_group.sg[*].id
}

output "vpc_id" {
  description = "value of the vpc id"
  value = [{
    "vpc_id" : module.vpc.vpc_id
  }]
}

output "subnets" {
  description = "value of the subnet ids"
  value = [{
    "private" : module.vpc.private_subnets[*],
    "public" : module.vpc.public_subnets[*]
  }]
}

output "alb_dns_name" {
  description = "value of the alb dns name"
  value       = module.alb.dns_name
}

output "alb_name" {
  description = "value of the alb name"
  value       = module.alb.name
}

output "alb_arn" {
  description = "value of the alb arn"
  value       = module.alb.arn
}

output "eks_vpc_config" {
  description = "value of the eks vpc config"
  value       = module.eks_cluster.eks_vpc_config
}

output "oidc" {
  value = module.eks_cluster.oidc
}

output "eks_name" {
  description = "value of the eks name"
  value       = module.eks_cluster.cluster_name
}

output "node_group_name" {
  description = "value of the node group name"
  value       = module.managed_node_group.managed_node_group_name
}