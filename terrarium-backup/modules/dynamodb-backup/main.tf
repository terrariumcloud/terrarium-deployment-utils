locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
}

# KMS encryption key for DynamoDB Backup Vault
resource "aws_kms_key" "terrarium_dynamodb_kms_key" {
  description             = "Encrypt backups in DynamoDB backup vault"
  deletion_window_in_days = 10
}

resource "aws_kms_alias" "terrarium_dynamodb_kms_key_alias" {
  name          = "${var.kms_key_alias_prefix}/${var.terrarium_dynamodb_kms_key_name}"
  target_key_id = aws_kms_key.terrarium_dynamodb_kms_key.arn
}

# Backup vault for DynamoDB
resource "aws_backup_vault" "terrarium_dynamodb_backup_vault" {
  name        = var.terrarium_dynamodb_backup_vault_name
  kms_key_arn = aws_kms_key.terrarium_dynamodb_kms_key.arn
  force_destroy = true
}

# Backup plan for DynamoDB
resource "aws_backup_plan" "terrarium_dynamodb_backup_plan" {
  name = var.terrarium_dynamodb_backup_plan_name

  rule {
    rule_name                = var.terrarium_dynamodb_backup_plan_rule
    target_vault_name        = aws_backup_vault.terrarium_dynamodb_backup_vault.name
    schedule                 = var.terrarium_dynamodb_backup_cron
    enable_continuous_backup = true
    start_window             = var.terrarium_dynamodb_backup_start_window
    completion_window        = var.terrarium_dynamodb_backup_completion_window

    lifecycle {
      delete_after = var.terrarium_dynamodb_backup_delete
    }

    copy_action {
      destination_vault_arn = aws_backup_vault.terrarium_dynamodb_backup_vault.arn
      lifecycle {
        delete_after = var.terrarium_dynamodb_backup_delete
      }
    }
  }
}

# Backup selection for DynamoDB
# Specify a set of resources to a backup plan
resource "aws_backup_selection" "terrarium_dynamodb_backup_selection" {
  iam_role_arn = aws_iam_role.terrarium_dynamodb_backup_iam_role.arn
  name         = var.terrarium_dynamodb_backup_selection_name
  plan_id      = aws_backup_plan.terrarium_dynamodb_backup_plan.id
  resources = [
    # "arn:aws:dynamodb:eu-central-1:341495406858:table/modules",
    "arn:aws:dynamodb:${local.region}:${local.account_id}:table/${var.terrarium_table_modules}",
    "arn:aws:dynamodb:${local.region}:${local.account_id}:table/${var.terrarium_table_module_versions}",
    "arn:aws:dynamodb:${local.region}:${local.account_id}:table/${var.terrarium_table_module_dependencies}"
  ]
}