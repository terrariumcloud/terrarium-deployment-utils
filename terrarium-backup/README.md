## Description

This repository contains Terraform code for the implementation of the backup strategy for the DynamoDB/S3 storage.

### AWS Backup and Security
Backup is implemented by utilizing the AWS managed [Backup](https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html) service.  AWS Backup strategy includes defining the following resources:

* Backup vault - A logical container that stores the backups.
* Backup plan - A set of rules that specify when AWS Backup initiates a backup job.
* Backup selection - A set of resources to assign to a backup plan.

In terms of **security**, the server-side encryption key (KMS key) is created that is used to protect the backups.

### Permission Policies
Necessary permission policies for the (existing) IAM user to be able to access DynamoDB and S3 are the following:
* AmazonDynamoDBFullAccess
* AmazonS3FullAccess
* AWSBackupFullAccess

In order for Terraform to create an IAM role and to be able to create KMS keys for encrypting backups, the following permission policies are needed.

* AWSKeyManagementServicePowerUser
* IAMFullAccess

The default `AWSKeyManagementServicePowerUser` policy does not include schedule key deletion permission which prevents KMS keys from being deleted. For this reason, create a custom policy, i.e. `CustomKMSScheduleKeyDeletion` with `kms:ScheduleKeyDeletion` action.

### Notes
DynamoDB backup and S3 backup are implemented as Terraform modules that can be reusable.

The `backup plan` can be updated. The update would not have an effect on the previous backups, only will be applied to backups created in the future. 

*Suggested improvement: Expand the current Terraform configuration to create a Terrarium user and assign needed permissions at deployment time. For now, permissions policies have been added manually in order to be able to test the backup strategy.*

---

## Prerequisites

Before Terraform deployment, export environment variables.

```
export AWS_ACCESS_KEY_ID=TERRARIUM_USER_KEY
export AWS_SECRET_ACCESS_KEY=TERRARIUM_USER_SECRET_KEY
export AWS_REGION=TERRRIUM_REGION
```


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.31.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dynamodb-backup"></a> [dynamodb-backup](#module\_dynamodb-backup) | ./modules/dynamodb-backup | n/a |
| <a name="module_s3-backup"></a> [s3-backup](#module\_s3-backup) | ./modules/s3-backup | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kms_key_alias_prefix"></a> [kms\_key\_alias\_prefix](#input\_kms\_key\_alias\_prefix) | KMS key required prefix | `string` | `"alias"` | no |
| <a name="input_terrarium_dynamodb_backup_completion_window"></a> [terrarium\_dynamodb\_backup\_completion\_window](#input\_terrarium\_dynamodb\_backup\_completion\_window) | The amount of time in minutes AWS Backup attempts a backup before canceling the job and returning an error | `number` | n/a | yes |
| <a name="input_terrarium_dynamodb_backup_cron"></a> [terrarium\_dynamodb\_backup\_cron](#input\_terrarium\_dynamodb\_backup\_cron) | A CRON expression specifying when AWS Backup initiates a backup job | `string` | n/a | yes |
| <a name="input_terrarium_dynamodb_backup_delete"></a> [terrarium\_dynamodb\_backup\_delete](#input\_terrarium\_dynamodb\_backup\_delete) | Specifies the number of days after creation that a recovery point is deleted. Must be 90 days greater than cold\_storage\_after | `number` | n/a | yes |
| <a name="input_terrarium_dynamodb_backup_iam_policy_arn"></a> [terrarium\_dynamodb\_backup\_iam\_policy\_arn](#input\_terrarium\_dynamodb\_backup\_iam\_policy\_arn) | Set of managed IAM Backup Policies for DynamoDB to be attached to role | `list(string)` | n/a | yes |
| <a name="input_terrarium_dynamodb_backup_iam_role_name"></a> [terrarium\_dynamodb\_backup\_iam\_role\_name](#input\_terrarium\_dynamodb\_backup\_iam\_role\_name) | The name of an IAM role for DynamoDB AWS Backups | `string` | n/a | yes |
| <a name="input_terrarium_dynamodb_backup_plan_name"></a> [terrarium\_dynamodb\_backup\_plan\_name](#input\_terrarium\_dynamodb\_backup\_plan\_name) | The name of the backup plan for DynamoDB | `string` | n/a | yes |
| <a name="input_terrarium_dynamodb_backup_plan_rule"></a> [terrarium\_dynamodb\_backup\_plan\_rule](#input\_terrarium\_dynamodb\_backup\_plan\_rule) | A rule object name that specifies a scheduled task that is used to back up a selection of resources | `string` | n/a | yes |
| <a name="input_terrarium_dynamodb_backup_selection_name"></a> [terrarium\_dynamodb\_backup\_selection\_name](#input\_terrarium\_dynamodb\_backup\_selection\_name) | The name of a DynamoDB resource selection document. | `string` | n/a | yes |
| <a name="input_terrarium_dynamodb_backup_start_window"></a> [terrarium\_dynamodb\_backup\_start\_window](#input\_terrarium\_dynamodb\_backup\_start\_window) | The amount of time in minutes before beginning a backup | `number` | n/a | yes |
| <a name="input_terrarium_dynamodb_backup_vault_name"></a> [terrarium\_dynamodb\_backup\_vault\_name](#input\_terrarium\_dynamodb\_backup\_vault\_name) | The name of the backup vault for DynamoDB | `string` | n/a | yes |
| <a name="input_terrarium_dynamodb_kms_key_name"></a> [terrarium\_dynamodb\_kms\_key\_name](#input\_terrarium\_dynamodb\_kms\_key\_name) | The name of the KMS key for DynamoDB backup vault | `string` | n/a | yes |
| <a name="input_terrarium_s3_backup_completion_window"></a> [terrarium\_s3\_backup\_completion\_window](#input\_terrarium\_s3\_backup\_completion\_window) | The amount of time in minutes AWS Backup attempts a backup before canceling the job and returning an error | `number` | n/a | yes |
| <a name="input_terrarium_s3_backup_cron"></a> [terrarium\_s3\_backup\_cron](#input\_terrarium\_s3\_backup\_cron) | A CRON expression specifying when AWS Backup initiates a backup job | `string` | n/a | yes |
| <a name="input_terrarium_s3_backup_delete"></a> [terrarium\_s3\_backup\_delete](#input\_terrarium\_s3\_backup\_delete) | Specifies the number of days after creation that a recovery point is deleted. Must be 90 days greater than cold\_storage\_after | `number` | n/a | yes |
| <a name="input_terrarium_s3_backup_iam_policy_arn"></a> [terrarium\_s3\_backup\_iam\_policy\_arn](#input\_terrarium\_s3\_backup\_iam\_policy\_arn) | Set of managed IAM Backup Policies for S3 to be attached to role | `list(string)` | n/a | yes |
| <a name="input_terrarium_s3_backup_iam_role_name"></a> [terrarium\_s3\_backup\_iam\_role\_name](#input\_terrarium\_s3\_backup\_iam\_role\_name) | The name of an IAM role for S3 AWS Backups | `string` | n/a | yes |
| <a name="input_terrarium_s3_backup_plan_name"></a> [terrarium\_s3\_backup\_plan\_name](#input\_terrarium\_s3\_backup\_plan\_name) | The name of the backup plan for s3 | `string` | n/a | yes |
| <a name="input_terrarium_s3_backup_plan_rule"></a> [terrarium\_s3\_backup\_plan\_rule](#input\_terrarium\_s3\_backup\_plan\_rule) | A rule object name that specifies a scheduled task that is used to back up a selection of resources | `string` | n/a | yes |
| <a name="input_terrarium_s3_backup_selection_name"></a> [terrarium\_s3\_backup\_selection\_name](#input\_terrarium\_s3\_backup\_selection\_name) | The name of an S3 resource selection document. | `string` | n/a | yes |
| <a name="input_terrarium_s3_backup_start_window"></a> [terrarium\_s3\_backup\_start\_window](#input\_terrarium\_s3\_backup\_start\_window) | The amount of time in minutes before beginning a backup | `number` | n/a | yes |
| <a name="input_terrarium_s3_backup_vault_name"></a> [terrarium\_s3\_backup\_vault\_name](#input\_terrarium\_s3\_backup\_vault\_name) | The name of the backup vault for S3 | `string` | n/a | yes |
| <a name="input_terrarium_s3_bucket_modules"></a> [terrarium\_s3\_bucket\_modules](#input\_terrarium\_s3\_bucket\_modules) | Terrarium S3 bucket for terrarium modules | `string` | n/a | yes |
| <a name="input_terrarium_s3_kms_key_name"></a> [terrarium\_s3\_kms\_key\_name](#input\_terrarium\_s3\_kms\_key\_name) | The name of the KMS key for S3 backup vault | `string` | n/a | yes |
| <a name="input_terrarium_table_module_dependencies"></a> [terrarium\_table\_module\_dependencies](#input\_terrarium\_table\_module\_dependencies) | Terrarium DynamoDB Table for terrarium module dependencies | `string` | n/a | yes |
| <a name="input_terrarium_table_module_versions"></a> [terrarium\_table\_module\_versions](#input\_terrarium\_table\_module\_versions) | Terrarium DynamoDB Table for terrarium modules versions | `string` | n/a | yes |
| <a name="input_terrarium_table_modules"></a> [terrarium\_table\_modules](#input\_terrarium\_table\_modules) | Terrarium DynamoDB Table for terrarium modules | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->