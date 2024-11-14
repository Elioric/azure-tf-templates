# Container Apps Deployment with Application Gateway on Azure

This repository contains Terraform templates to deploy **Container Apps** on Azure, configured to run behind an **Application Gateway**. The setup enables secure, scalable, and efficient management of containerized applications by using Azure's networking and monitoring services.

## Repository Structure

Below is a brief overview of each file and its purpose in the deployment:

- **acr\.tf**: Configures **Azure Container Registry (ACR)**, a secure registry to store and manage container images, ensuring that all containerized applications are sourced from a centralized location.

- **agw\.tf**: Defines the **Azure Application Gateway (AGW)**, which is set up as a Layer 7 load balancer. It provides secure access to the container applications with features like URL-based routing, SSL termination, and Web Application Firewall (WAF) support.

- **alerts\.tf**: Sets up monitoring and **alerting** configurations to keep track of the application's performance and availability, allowing proactive management of issues.

- **containerapp\.tf**: Specifies the deployment of **Azure Container Apps**, which are managed container hosting services that automatically scale based on load. This file includes configurations for the container environment and the applications that will run within it.

- **data\.tf**: Contains **data sources** required for the infrastructure, such as existing resources or settings that need to be referenced across other files in the deployment.

- **keyvault\.tf**: Sets up **Azure Key Vault**, a service for managing and securing application secrets, credentials, and certificates, ensuring sensitive information is handled securely.

- **log-analytics\.tf**: Deploys **Azure Log Analytics**, which is used for monitoring and analyzing log data from the Container Apps and Application Gateway. This enables efficient troubleshooting and insights into performance and security.

- **main\.tf**: The main file that orchestrates the deployment by calling modules or resources defined across the other files in the repository.

- **resource-group\.tf**: Configures the **Azure Resource Group** in which all resources will be deployed, serving as a container for resources and organizing them by lifecycle.

- **variables\.tf**: Declares **variables** used throughout the Terraform configurations, allowing for easy customization of parameters like resource names, regions, and scaling settings.

- **vnet\.tf**: Configures the **Virtual Network (VNet)** and associated **subnets**. This allows for secure, isolated networking for the Container Apps and Application Gateway.

## Getting Started

To use this repository, ensure you have the following prerequisites:

1. **Terraform** installed on your machine.
2. Access to an **Azure account** with sufficient permissions to create resources.
3. Set up **Azure CLI** and authenticate.

A sample tfvars file is in the `vars` folder.

Once ready, you can initialize, plan, and apply the Terraform configuration:

```bash
terraform init
terraform validate
terraform plan -var-file ./vars/sample.tfvars -out main.tfplan
terraform apply main.tfplan
```

**Note**: Configuration variables for deployment should be treated as sensitive data. The variables file is included in the repository as an example; however, this is not a recommended practice. Please follow best practices for handling sensitive information.

To destroy the resources once you don't need them anymore, use this command:

```bash
terraform plan -var-file="./vars/sample.tfvars" -destroy -out main.destroy.tfplan
terraform apply main.destroy.tfplan
```