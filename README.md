# Terrarium Deployment Utilities

A repo for Terrarium Deployment Utilities such as Helm charts and Terraform modules

## Deployment

1. Download a [relevant release](https://github.com/terrariumcloud/terrarium-deployment-utils/releases)
2. Update secrets:

```
aws_access_key_id: <BASE64_ENCODED_ACCESS_KEY_ID>
aws_access_key_secret: <BASE64_ENCODED_ACCESS_KEY_SECRET>
aws_region: <BASE64_ENCODED_AWS_REGION>
imagePullSecret: <BASE64_ENCODED_DOCKER_SECRET>
ingress:
  host: <HOSTNAME>
tls:
  crt: <BASE64_ENCODED_TLS_CERTIFICATE>
  key: <BASE64_ENCODED_TLS_KEY>
```

1. Execute `helm install terrarium ./<PATH_TO CHART_ZIP>`
