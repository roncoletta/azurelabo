# Create a docker for a Azure Agent pipeline with terraform installed

This Dockerfile creates a container of an Azure Agent pipeline with terraform installed


## Étapes à suivre (local)
1.  ` docker build . --tag docker-agent:latest `
1.  `docker run -e AZP_URL=https://dev.azure.com/<YOUR_AZURE_DEVOPS_PROJECT>
    -e AZP_TOKEN=<AZP_TOKEN>
    -e AZP_AGENT_NAME=docker-agent docker-agent:latest
    `

## Version compatibility

| Module version | Terraform version |
|----------------|-------------------|
| >= 1.x.x       | 1.0.5             |
