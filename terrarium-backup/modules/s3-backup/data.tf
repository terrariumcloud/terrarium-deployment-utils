# Metadata
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_iam_policy_document" "terrarium_s3_backup_iam_policy_document" {
  statement {
    sid     = "TerrariumBackupIamPolicyDocument"
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["backup.amazonaws.com"]
    }
  }
}