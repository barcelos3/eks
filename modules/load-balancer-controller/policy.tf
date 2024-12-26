resource "aws_iam_policy" "eks_controller_policy" {
  name   = lower("${var.project_name}-load-controller-policy")
  policy = file("${path.module}/iam_policy.json")
  tags   = var.tags
}