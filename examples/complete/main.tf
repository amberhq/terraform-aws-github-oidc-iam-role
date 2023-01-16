module "github_oidc_role" {
  source = "../../"
  iam_role_name = "github-oidc"
  oidc_assume_role_condition = "repo:niraj8/*:*"
}
