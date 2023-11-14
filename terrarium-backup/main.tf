terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.31.0"
    }
  }

  backend "s3" {
    bucket = "terrarium-backup-state"
    key    = "terrarium-backup"
    region = "eu-west-1"
  }
}

provider "aws" {}

# DynamoDB Backup Module
module "dynamodb-backup" {
  source                                      = "./modules/dynamodb-backup"
  terrarium_table_modules                     = var.terrarium_table_modules
  terrarium_table_module_versions             = var.terrarium_table_module_versions
  terrarium_table_module_dependencies         = var.terrarium_table_module_dependencies
  terrarium_table_container_dependencies      = var.terrarium_table_container_dependencies
  terrarium_table_tag_manager                 = var.terrarium_table_tag_manager
  terrarium_table_releases                    = var.terrarium_table_releases
  kms_key_alias_prefix                        = var.kms_key_alias_prefix
  terrarium_dynamodb_kms_key_name             = var.terrarium_dynamodb_kms_key_name
  terrarium_dynamodb_backup_iam_role_name     = var.terrarium_dynamodb_backup_iam_role_name
  terrarium_dynamodb_backup_iam_policy_arn    = var.terrarium_dynamodb_backup_iam_policy_arn
  terrarium_dynamodb_backup_vault_name        = var.terrarium_dynamodb_backup_vault_name
  terrarium_dynamodb_backup_plan_name         = var.terrarium_dynamodb_backup_plan_name
  terrarium_dynamodb_backup_plan_rule         = var.terrarium_dynamodb_backup_plan_rule
  terrarium_dynamodb_backup_cron              = var.terrarium_dynamodb_backup_cron
  terrarium_dynamodb_backup_start_window      = var.terrarium_dynamodb_backup_start_window
  terrarium_dynamodb_backup_completion_window = var.terrarium_dynamodb_backup_completion_window
  terrarium_dynamodb_backup_delete            = var.terrarium_dynamodb_backup_delete
  terrarium_dynamodb_backup_selection_name    = var.terrarium_dynamodb_backup_selection_name
}

# S3 Backup Module
module "s3-backup" {
  source                                = "./modules/s3-backup"
  terrarium_s3_bucket_modules           = var.terrarium_s3_bucket_modules
  kms_key_alias_prefix                  = var.kms_key_alias_prefix
  terrarium_s3_kms_key_name             = var.terrarium_s3_kms_key_name
  terrarium_s3_backup_iam_role_name     = var.terrarium_s3_backup_iam_role_name
  terrarium_s3_backup_iam_policy_arn    = var.terrarium_s3_backup_iam_policy_arn
  terrarium_s3_backup_vault_name        = var.terrarium_s3_backup_vault_name
  terrarium_s3_backup_plan_name         = var.terrarium_s3_backup_plan_name
  terrarium_s3_backup_plan_rule         = var.terrarium_s3_backup_plan_rule
  terrarium_s3_backup_cron              = var.terrarium_s3_backup_cron
  terrarium_s3_backup_start_window      = var.terrarium_s3_backup_start_window
  terrarium_s3_backup_completion_window = var.terrarium_s3_backup_completion_window
  terrarium_s3_backup_delete            = var.terrarium_s3_backup_delete
  terrarium_s3_backup_selection_name    = var.terrarium_s3_backup_selection_name
}


