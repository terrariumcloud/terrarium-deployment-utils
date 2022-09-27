<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_backup_plan.terrarium_dynamodb_backup_plan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_plan) | resource |
| [aws_backup_selection.terrarium_dynamodb_backup_selection](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_selection) | resource |
| [aws_backup_vault.terrarium_dynamodb_backup_vault](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_vault) | resource |
| [aws_iam_role.terrarium_dynamodb_backup_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.terrarium_dynamodb_backup_iam_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kms_alias.terrarium_dynamodb_kms_key_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.terrarium_dynamodb_kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.terrarium_dynamodb_backup_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

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
| <a name="input_terrarium_table_module_dependencies"></a> [terrarium\_table\_module\_dependencies](#input\_terrarium\_table\_module\_dependencies) | Terrarium DynamoDB Table for terrarium module dependencies | `string` | n/a | yes |
| <a name="input_terrarium_table_module_versions"></a> [terrarium\_table\_module\_versions](#input\_terrarium\_table\_module\_versions) | Terrarium DynamoDB Table for terrarium modules versions | `string` | n/a | yes |
| <a name="input_terrarium_table_modules"></a> [terrarium\_table\_modules](#input\_terrarium\_table\_modules) | Terrarium DynamoDB Table for terrarium modules | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->