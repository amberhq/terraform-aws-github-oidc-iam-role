# terraform-aws-github-oidc-iam-role

Terraform module to create GitHub OIDC IAM role.

## Usage

TODO

<!-- BEGIN_TF_DOCS -->
#### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider_aws) | >= 3.0 |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_role_name"></a> [iam_role_name](#input_iam_role_name) | IAM role name | `string` | n/a | yes |
| <a name="input_oidc_assume_role_condition"></a> [oidc_assume_role_condition](#input_oidc_assume_role_condition) | Assume role condition for OIDC role | `string` | n/a | yes |
| <a name="input_max_session_duration"></a> [max_session_duration](#input_max_session_duration) | Max Session Duration for assumed role in seconds | `string` | `"3600"` | no |
| <a name="input_thumbprint_list"></a> [thumbprint_list](#input_thumbprint_list) | GitHub OIDC Issuer thumbprints | `list(string)` | <pre>[<br>  "40a7f38766174b05ed508887745115475b89535174957bae5c8445191db9e747"<br>]</pre> | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role_arn"></a> [iam_role_arn](#output_iam_role_arn) | IAM role ARN |
<!-- END_TF_DOCS -->
