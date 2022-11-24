# Creation of a Storage Acount

This terraform project creates:
1 - A storage account to keep the terraform state files (tfstate)

## Étapes à suivre (local)

1 - A storage account to keep the terraform state files (tfstate
2 - Azure client install
2 - Terraform cli install
3 - Get the information identify below, and execute the commands in comand line.

For execute terraform commands with a service principal without a azure login:
``
-export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
-export ARM_CLIENT_SECRET="00000000-0000-0000-0000-000000000000"
-export ARM_SUBSCRIPTION_ID="00000000-0000-0000-0000-000000000000"
-export ARM_TENANT_ID="00000000-0000-0000-0000-000000000000

``

## Version compatibility

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 1.x.x       | 0.13.x            | >= 2.0          |
