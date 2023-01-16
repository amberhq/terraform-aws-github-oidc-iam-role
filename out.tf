output "iam_role_arn" {
  value       = aws_iam_role.oidc.arn
  description = "IAM role ARN"
}
