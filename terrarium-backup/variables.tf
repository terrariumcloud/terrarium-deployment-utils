# Global KMS Alias - must not be changed!
variable "kms_key_alias_prefix" {
  type        = string
  description = "KMS key required prefix"
  default     = "alias"
}

####################
#  DynamoDB Backup #
####################

# Table Names
variable "terrarium_table_modules" {
  type        = string
  description = "Terrarium DynamoDB Table for terrarium modules"
}

variable "terrarium_table_module_versions" {
  type        = string
  description = "Terrarium DynamoDB Table for terrarium modules versions"
}

variable "terrarium_table_module_dependencies" {
  type        = string
  description = "Terrarium DynamoDB Table for terrarium module dependencies"
}

# IAM DynamoDB
variable "terrarium_dynamodb_backup_iam_role_name" {
  type        = string
  description = "The name of an IAM role for DynamoDB AWS Backups"
}
# Define policy ARNs as list
variable "terrarium_dynamodb_backup_iam_policy_arn" {
  type        = list(string)
  description = "Set of managed IAM Backup Policies for DynamoDB to be attached to role"
}

# KMS
variable "terrarium_dynamodb_kms_key_name" {
  type        = string
  description = "The name of the KMS key for DynamoDB backup vault"
}

# BACKUP VAULT
variable "terrarium_dynamodb_backup_vault_name" {
  type        = string
  description = "The name of the backup vault for DynamoDB"
}

# BACKUP PLAN
variable "terrarium_dynamodb_backup_plan_name" {
  type        = string
  description = "The name of the backup plan for DynamoDB"
}

variable "terrarium_dynamodb_backup_plan_rule" {
  type        = string
  description = "A rule object name that specifies a scheduled task that is used to back up a selection of resources"
}

variable "terrarium_dynamodb_backup_cron" {
  type        = string
  description = "A CRON expression specifying when AWS Backup initiates a backup job"
}

variable "terrarium_dynamodb_backup_start_window" {
  type        = number
  description = "The amount of time in minutes before beginning a backup"
}

variable "terrarium_dynamodb_backup_completion_window" {
  type        = number
  description = "The amount of time in minutes AWS Backup attempts a backup before canceling the job and returning an error"
}

variable "terrarium_dynamodb_backup_delete" {
  type        = number
  description = "Specifies the number of days after creation that a recovery point is deleted. Must be 90 days greater than cold_storage_after"
}

# BACKUP SELECTION
variable "terrarium_dynamodb_backup_selection_name" {
  type        = string
  description = "The name of a DynamoDB resource selection document."
}

###################
#     S3 Backup   #
###################

# S3 ARN
variable "terrarium_s3_bucket_modules" {
  type        = string
  description = "Terrarium S3 bucket for terrarium modules"
}

# IAM
variable "terrarium_s3_backup_iam_role_name" {
  type        = string
  description = "The name of an IAM role for S3 AWS Backups"
}
# Define policy ARNs as list
variable "terrarium_s3_backup_iam_policy_arn" {
  type        = list(string)
  description = "Set of managed IAM Backup Policies for S3 to be attached to role"
}

# KMS
variable "terrarium_s3_kms_key_name" {
  type        = string
  description = "The name of the KMS key for S3 backup vault"
}

# BACKUP VAULT
variable "terrarium_s3_backup_vault_name" {
  type        = string
  description = "The name of the backup vault for S3"
}
# BACKUP PLAN
variable "terrarium_s3_backup_plan_name" {
  type        = string
  description = "The name of the backup plan for s3"
}

variable "terrarium_s3_backup_plan_rule" {
  type        = string
  description = "A rule object name that specifies a scheduled task that is used to back up a selection of resources"
}

variable "terrarium_s3_backup_cron" {
  type        = string
  description = "A CRON expression specifying when AWS Backup initiates a backup job"
}

variable "terrarium_s3_backup_start_window" {
  type        = number
  description = "The amount of time in minutes before beginning a backup"
}

variable "terrarium_s3_backup_completion_window" {
  type        = number
  description = "The amount of time in minutes AWS Backup attempts a backup before canceling the job and returning an error"
}

variable "terrarium_s3_backup_delete" {
  type        = number
  description = "Specifies the number of days after creation that a recovery point is deleted. Must be 90 days greater than cold_storage_after"
}

# BACKUP SELECTION
variable "terrarium_s3_backup_selection_name" {
  type        = string
  description = "The name of an S3 resource selection document."
}