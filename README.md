# terraform-aws-github-oidc-iam-role

Terraform module to create GitHub OIDC IAM role.

## Usage

For more information about security hardening your tokens, see [About security hardening with OpenID Connect](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/about-security-hardening-with-openid-connect#example-subject-claims) 
 
### Allow all repositories in your organization to use this role

```terraform
module "github_oidc_role" {
  source                     = "niraj8/github-oidc-iam-role/aws"
  version                    = "x.x.x"
  iam_role_name              = "github-org-oidc"
  oidc_assume_role_condition = "repo:<github-org-name-here>/*:*"
}
```

### Allow role to be assumed only by specific repository on a specific branch(example: main)

```terraform
module "github_oidc_role" {
  source                     = "niraj8/github-oidc-iam-role/aws"
  version                    = "x.x.x"
  iam_role_name              = "github-repo-main-oidc"
  oidc_assume_role_condition = "repo:<github-org-name-here>/<repository>:refs/head/main"
}
```

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
| <a name="input_thumbprint_list"></a> [thumbprint_list](#input_thumbprint_list) | GitHub OIDC Issuer thumbprints | `list(string)` | <pre>[<br>  "6938fd4d98bab03faadb97b34396831e3780aea1"<br>]</pre> | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role_arn"></a> [iam_role_arn](#output_iam_role_arn) | IAM role ARN |
<!-- END_TF_DOCS -->
