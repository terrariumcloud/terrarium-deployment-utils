resource "aws_iam_role" "terrarium_s3_backup_iam_role" {
  name               = var.terrarium_s3_backup_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.terrarium_s3_backup_iam_policy_document.json
  description        = "An IAM role for allowing AWS Backup to create backups for S3"
}

resource "aws_iam_role_policy_attachment" "terrarium_s3_backup_iam_role_policy_attachment" {
  role       = aws_iam_role.terrarium_s3_backup_iam_role.name
  count      = length(var.terrarium_s3_backup_iam_policy_arn)
  policy_arn = var.terrarium_s3_backup_iam_policy_arn[count.index]
}