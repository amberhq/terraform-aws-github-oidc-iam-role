variable "iam_role_name" {
  type        = string
  description = "IAM role name"
}

variable "max_session_duration" {
  type        = string
  description = "Max Session Duration for assumed role in seconds"
  default     = "3600"
}

variable "thumbprint_list" {
  type        = list(string)
  description = "GitHub OIDC Issuer thumbprints"
  default     = [
    "25768713d3b459f9382d2a594f85f34709fd2a8930731542a4146ffb246bec69"
  ]
}

# https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services#configuring-the-role-and-trust-policy
variable "oidc_assume_role_condition" {
  type        = string
  description = "Assume role condition for OIDC role"
}
