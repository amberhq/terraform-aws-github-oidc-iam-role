output "iam_role_arn" {
  value       = aws_iam_role.oidc.arn
  description = "IAM role ARN"
}

output "iam_role_name" {
  value       = aws_iam_role.oidc.name
  description = "IAM role name"
}
