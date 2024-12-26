resource "aws_eks_node_group" "eks_managed_node_group" {
  cluster_name    = var.eks_cluster_name
  node_group_name = lower("${var.project_name}-node-group")
  node_role_arn   = aws_iam_role.eks_mng_role.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  tags = merge(
    var.tags,
    {
      "Name" = lower("${var.project_name}-node-group")
    }
  )

  depends_on = [
    aws_iam_role_policy_attachment.mng_role_attachment_worker,
    aws_iam_role_policy_attachment.mng_role_attachment_cni,
    aws_iam_role_policy_attachment.mng_role_attachment_ecr,
  ]
}