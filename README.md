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
| [aws_cognito_resource_server.resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_resource_server) | resource |
| [aws_cognito_user_pool.mule_api_user_pool](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool) | resource |
| [aws_cognito_user_pool_client.app_client](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_client) | resource |
| [aws_cognito_user_pool_domain.domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_domain) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_token_validity"></a> [access\_token\_validity](#input\_access\_token\_validity) | n/a | `string` | `""` | no |
| <a name="input_access_token_validity_unit"></a> [access\_token\_validity\_unit](#input\_access\_token\_validity\_unit) | n/a | `string` | `""` | no |
| <a name="input_aws_cognito_resource_server_identifier"></a> [aws\_cognito\_resource\_server\_identifier](#input\_aws\_cognito\_resource\_server\_identifier) | n/a | `string` | `""` | no |
| <a name="input_aws_cognito_resource_server_name"></a> [aws\_cognito\_resource\_server\_name](#input\_aws\_cognito\_resource\_server\_name) | n/a | `string` | `""` | no |
| <a name="input_aws_cognito_user_pool_client_name"></a> [aws\_cognito\_user\_pool\_client\_name](#input\_aws\_cognito\_user\_pool\_client\_name) | n/a | `string` | `""` | no |
| <a name="input_aws_cognito_user_pool_domain"></a> [aws\_cognito\_user\_pool\_domain](#input\_aws\_cognito\_user\_pool\_domain) | n/a | `string` | `""` | no |
| <a name="input_aws_cognito_user_pool_name"></a> [aws\_cognito\_user\_pool\_name](#input\_aws\_cognito\_user\_pool\_name) | n/a | `string` | `""` | no |
| <a name="input_client_app_and_settings"></a> [client\_app\_and\_settings](#input\_client\_app\_and\_settings) | n/a | `string` | `""` | no |
| <a name="input_client_resource_server"></a> [client\_resource\_server](#input\_client\_resource\_server) | n/a | `string` | `""` | no |
| <a name="input_id_token_validity"></a> [id\_token\_validity](#input\_id\_token\_validity) | n/a | `string` | `""` | no |
| <a name="input_id_token_validity_unit"></a> [id\_token\_validity\_unit](#input\_id\_token\_validity\_unit) | n/a | `string` | `""` | no |
| <a name="input_provider_env_roles"></a> [provider\_env\_roles](#input\_provider\_env\_roles) | n/a | `map` | <pre>{<br>  "dev": "",<br>  "pre-prod": "arn:aws:iam::327711378138:role/terraform_role",<br>  "prod": "arn:aws:iam::204142478968:role/terraform_role",<br>  "stage": "arn:aws:iam::570400125078:role/terraform-role",<br>  "test": "arn:aws:iam::903879511348:role/terraform_role"<br>}</pre> | no |
| <a name="input_refresh_token_validity"></a> [refresh\_token\_validity](#input\_refresh\_token\_validity) | n/a | `string` | `""` | no |
| <a name="input_refresh_token_validity_unit"></a> [refresh\_token\_validity\_unit](#input\_refresh\_token\_validity\_unit) | n/a | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mule_api_user_pool_client_id"></a> [mule\_api\_user\_pool\_client\_id](#output\_mule\_api\_user\_pool\_client\_id) | n/a |
| <a name="output_mule_app_client_id"></a> [mule\_app\_client\_id](#output\_mule\_app\_client\_id) | n/a |
| <a name="output_mule_app_client_secret"></a> [mule\_app\_client\_secret](#output\_mule\_app\_client\_secret) | n/a |
| <a name="output_resource_server_scope"></a> [resource\_server\_scope](#output\_resource\_server\_scope) | n/a |

