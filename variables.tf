variable "iam_role_name" {
  type        = string
  description = "IAM role name"
}

variable "max_session_duration" {
  type        = string
  description = "Max Session Duration for assumed role in seconds"
  default     = "3600"
}

# https://github.com/hashicorp/terraform-provider-aws/issues/28916
variable "thumbprint_list" {
  type        = list(string)
  description = "GitHub OIDC Issuer thumbprints"
  default = [
    # From https://github.blog/changelog/2022-01-13-github-actions-update-on-oidc-based-deployments-to-aws/
    "6938fd4d98bab03faadb97b34396831e3780aea1"
  ]
}

# https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services#configuring-the-role-and-trust-policy
variable "oidc_assume_role_condition" {
  type        = string
  description = "Assume role condition for OIDC role"
}

variable "role_policy_arns" {
  type        = list(string)
  description = "List of ARNs of IAM policies to attach to the IAM role"
  default     = []
}
