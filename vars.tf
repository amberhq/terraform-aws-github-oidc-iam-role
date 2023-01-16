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
    "40a7f38766174b05ed508887745115475b89535174957bae5c8445191db9e747"
  ]
}

# https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services#configuring-the-role-and-trust-policy
variable "oidc_assume_role_condition" {
  type        = string
  description = "Assume role condition for OIDC role"
}
