# PostgreSQL Database Deployment with Read Replica using Terraform

This repository contains **Terraform templates** designed for deploying a PostgreSQL Flexible Server on Azure with a configured **read replica**. This setup provides enhanced control over the database server service by using Terraform to define and manage the **read replica**, allowing flexibility beyond standard high availability or geo-replication options.

## Purpose and Benefits of this Configuration

The main objective of this configuration is to ensure a **Disaster Recovery Plan (DRP)** by maintaining a separate read replica. This allows:
- One instance to handle **write operations**, while the **read replica** serves **read operations**.
- Enhanced **control over data redundancy** and **distribution of workload**, which improves both performance and reliability.
- Improved resilience and fault tolerance by separating read and write operations, reducing potential bottlenecks on the primary database server.

Additionally, this repository includes an **Azure Pipeline** for automated execution and deployment of the templates, ensuring consistent and repeatable infrastructure management.

## Repository Structure

Below is a brief description of each file and directory in this repository:

- **`main.tf`**: The main configuration file that orchestrates the deployment, pulling in resources and configurations from the other Terraform files.
  
- **`database.tf`**: Contains the configuration for the **primary PostgreSQL database server** and the **read replica**. The primary database server is set up to handle write operations, while the replica is designed to handle read operations, enhancing scalability and performance.

- **`resource-group.tf`**: Creates the **Azure Resource Group** that will contain all resources for this deployment, ensuring that they are organized and managed together.

- **`variables.tf`**: Defines the **variables** used across the Terraform configuration files, allowing easy customization of parameters like resource names, locations, and database configurations.

- **`vnet.tf`**: Configures the **Virtual Network (VNet)** and **subnets** needed for secure communication between the primary database server and the read replica. This ensures that both instances remain within a private, isolated network space.

- **`vars/sample.tfvars`**: A sample file for defining values for each variable defined in `variables.tf`. This file can be used as a reference to set up specific configurations, such as database size, network settings, and administrative credentials.

## Deployment Pipeline

An **Azure Pipeline** is configured to automate the execution of these Terraform templates, enabling a streamlined and repeatable deployment process. This pipeline ensures that infrastructure changes can be easily applied, managed, and versioned.

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