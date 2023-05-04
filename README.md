# Complete DevOps Project 2: Terraform Multi-Environment Infrastructure Project

This project demonstrates the use of Terraform to create a complete infrastructure setup, including networking, RDS instances, and Elastic Cache. The project is organized into separate environments (dev and prod) using workspaces and incorporates a Lambda function to send email notifications when the infrastructure state changes.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [License](#license)

## Overview

This project provisions the following resources:
- Networking components such as VPC, Internet Gateway, NAT Gateway, Route Tables, and Security Groups.
- EC2 instances for bastion and application hosts.
- RDS instance and Elastic Cache using Terraform modules.
- Separate workspaces for `dev` and `prod` environments.
- A Lambda function to detect changes in the Terraform state file and send email notifications.

## Features

### 1. Networking

The project creates a VPC with the following components:
- An Internet Gateway to provide a connection between the VPC and the internet.
- A NAT Gateway to allow instances in private subnets to access the internet.
- Public and private subnets for hosting various resources.
- Public and Private Route Tables to manage traffic between subnets and the internet.
- Security Groups for allowing SSH from the public internet and application access within the VPC.

### 2. EC2 Instances

Two EC2 instances are created in this project:
- A bastion host with a public IP address and an associated Security Group for SSH access. This instance is placed in the public subnet.
- An application host with a private IP address and an associated Security Group for application access. This instance is placed in the private subnet.

### 3. Database and Cache

An RDS instance and Elastic Cache are provisioned using Terraform modules:
- The RDS instance is created using the AWS RDS service and is managed by Terraform.
- Elastic Cache is created using the [terraform-aws-modules/rds/aws](https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/latest) module.

### 4. Workspace and Environment Setup

The project is organized into separate environments (dev and prod) using workspaces:
- Workspaces are created for the `dev` and `prod` environments.
- Variable definition files (.tfvars) are used to manage different configurations for each environment.
- The Terraform code is applied to create environments in `us-east-1` and `eu-central-1`.
- A local-exec provisioner is used to print the public IP of the bastion host.

### 5. Additional Features

- The infrastructure code is uploaded to a Github project.
- A Lambda function is set up to trigger when changes are detected in the Terraform state file. The function sends email notifications for these changes.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) 0.12.x or later
- [AWS CLI](https://aws.amazon.com/cli/) and an AWS account with necessary permissions

## Usage

1. Clone the repository:

```sh
git clone https://github.com/yourusername/complete-devops-project-2.git
cd complete-devops-project-2
```

2. Initialize Terraform:

```sh
terraform init
```

3. Create a new Terraform workspace for the desired environment (`dev` or `prod`):

```sh
terraform workspace new <workspace_name>
```

4. Update the respective `.tfvars` file with the required values for your environment.

5. Apply the Terraform configuration:

```sh
terraform apply -var-file=<environment>.tfvars
```

6. To destroy the infrastructure, run:

```sh
terraform destroy -var-file=<environment>.tfvars
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.