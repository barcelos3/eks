# resource "aws_eks_cluster" "eks" {
#   name     = lower("${var.project_name}-${terraform.workspace}")
#   role_arn = aws_iam_role.iam-role-eks.arn

#   vpc_config {
#     subnet_ids = concat(
#       module.vpc.public_subnets,
#       module.vpc.private_subnets,
#     )
#   }

#   depends_on = [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy]
# }

# resource "aws_eks_node_group" "private-nodes" {
#   cluster_name    = aws_eks_cluster.eks.name
#   node_group_name = "private-nodes"
#   node_role_arn   = aws_iam_role.iam-role-nodes.arn
#   subnet_ids      = module.vpc.private_subnets

#   capacity_type  = "ON_DEMAND"
#   instance_types = ["t3.small"]

#   scaling_config {
#     desired_size = 1
#     max_size     = 5
#     min_size     = 0
#   }

#   update_config {
#     max_unavailable = 1
#   }

#   labels = {
#     role = "general"
#   }

#   # taint {
#   #   key    = "team"
#   #   value  = "devops"
#   #   effect = "NO_SCHEDULE"
#   # }

#   # launch_template {
#   #   name    = aws_launch_template.eks-with-disks.name
#   #   version = aws_launch_template.eks-with-disks.latest_version
#   # }

#   depends_on = [
#     aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReadOnly,
#   ]
# }

# # resource "aws_launch_template" "eks-with-disks" {
# #   name = "eks-with-disks"

# #   key_name = "local-provisioner"

# #   block_device_mappings {
# #     device_name = "/dev/xvdb"

# #     ebs {
# #       volume_size = 50
# #       volume_type = "gp2"
# #     }
# #   }
# # }
