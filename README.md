# Azure regions module

This terraform project creates:
1 - Azure DevOps agent in docker
2 - ACR
3 - AKS cluster attached to ACR

This terraform project is designed to be a demo Kubernetes in Azure.

It creates an AKS cluster in Azure and make a deployment of a simple application.

## Étapes à suivre (local)
1 - Azure client install
2 - Terraform cli install
3 -

## Version compatibility

| Module version | Terraform version | AzureRM version |
|----------------|-------------------| --------------- |
| >= 1.x.x       | 0.13.x            | >= 2.0          |

## Usage



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| azure\_region | Azure Region in slug format | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| location | Converted Azure region in standard format |
| location\_cli | Converted Azure region in Azure CLI name format |
| location\_short | Converted Azure region in short format for resource naming purpose |

## Related documentation
