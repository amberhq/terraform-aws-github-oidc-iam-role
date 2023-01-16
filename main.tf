locals {
  identity_oidc_issuer = "token.actions.githubusercontent.com"
  client_id = "sts.amazonaws.com"
}

data "aws_caller_identity" "current_account" {}

resource "aws_iam_openid_connect_provider" "github" {
  url             = "https://${local.identity_oidc_issuer}"
  client_id_list  = [local.client_id]
  thumbprint_list = var.thumbprint_list
}

data "aws_iam_policy_document" "github_oidc_assume_role" {
  statement {
    sid     = "0"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current_account.account_id}:oidc-provider/${local.identity_oidc_issuer}"]
    }

    condition {
      test     = "StringLike"
      variable = "${local.identity_oidc_issuer}:sub"
      values   = [var.oidc_assume_role_condition]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.identity_oidc_issuer}:aud"
      values   = [local.client_id]
    }
  }
}

resource "aws_iam_role" "oidc" {
  name                 = var.iam_role_name
  assume_role_policy   = data.aws_iam_policy_document.github_oidc_assume_role.json
  max_session_duration = var.max_session_duration
}
