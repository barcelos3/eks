resource "aws_eks_cluster" "eks_cluster" {
  name = lower(var.project_name)

  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = var.eks_version

  vpc_config {
    subnet_ids              = var.subnet_ids
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
  }

  tags = merge(
    var.tags,
    {
      "Name" = var.project_name
    }
  )

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_role_attachment,
  ]
}