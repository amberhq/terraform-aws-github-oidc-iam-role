module "aws_github_oidc_role" {
  source                     = "../../"
  iam_role_name              = "aws-github-oidc"
  oidc_assume_role_condition = "repo:amberhq/*:*"
  role_policy_arns           = [aws_iam_policy.oidc_additional_permissions.arn]
}

resource "aws_iam_role_policy_attachment" "oidc_allow_all" {
  role       = module.aws_github_oidc_role.iam_role_name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

data "aws_iam_policy_document" "oidc_additional_permissions" {
  statement {
    sid = "ElasticBeanstalkPermissionsForOIDCRole"
    actions = [
      "elasticbeanstalk:CreateApplicationVersion",
      "elasticbeanstalk:UpdateEnvironment",
    ]
    effect    = "Allow"
    resources = ["*"]
  }
  statement {
    sid     = "ElasticBeanstalkS3BucketPermission"
    actions = ["s3:*"]
    effect  = "Allow"
    resources = [
      "arn:aws:s3:::*elasticbeanstalk*",
      "arn:aws:s3:::elasticbeanstalk-*/*"
    ]
  }
  statement {
    sid       = "AutoScalingPermission"
    actions   = ["autoscaling:*"]
    effect    = "Allow"
    resources = ["*"]
  }
  statement {
    sid       = "LogsPermission"
    actions   = ["logs:*"]
    effect    = "Allow"
    resources = ["*"]
  }
  statement {
    sid       = "CloudformationPermission"
    actions   = ["cloudformation:*"]
    effect    = "Allow"
    resources = ["*"]
  }
}

resource "aws_iam_policy" "oidc_additional_permissions" {
  policy = data.aws_iam_policy_document.oidc_additional_permissions.json
}
