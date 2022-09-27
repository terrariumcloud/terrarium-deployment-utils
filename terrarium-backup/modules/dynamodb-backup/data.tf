# Metadata
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# IAM
data "aws_iam_policy_document" "terrarium_dynamodb_backup_iam_policy_document" {
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