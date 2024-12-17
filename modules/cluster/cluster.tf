resource "aws_eks_cluster" "eks_cluster" {
  name = var.project_name

  access_config {
    authentication_mode = "API"
  }

  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = "1.31"

  vpc_config {
    subnet_ids = var.subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = true
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