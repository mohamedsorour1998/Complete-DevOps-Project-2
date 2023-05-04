# Complete DevOps Project 2: Terraform Multi-Environment Infrastructure Project

This project demonstrates the use of Terraform to create a complete infrastructure setup, including networking, RDS instances, and Elastic Cache. The project is organized into separate environments (dev and prod) using workspaces and incorporates a Lambda function to send email notifications when the infrastructure state changes.
![1682176156190](https://user-images.githubusercontent.com/110028481/236076845-a933f455-92b6-4ed2-ad6d-52415da82f14.jpeg)

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
![Screenshot 2023-05-04 014145](https://user-images.githubusercontent.com/110028481/236076960-8ede403c-ebee-462a-9c1d-e8a99bf13494.png)
- An Internet Gateway to provide a connection between the VPC and the internet.
- A NAT Gateway to allow instances in private subnets to access the internet.
- Public and private subnets for hosting various resources.
- Public and Private Route Tables to manage traffic between subnets and the internet.
- Security Groups for allowing SSH from the public internet and application access within the VPC.
![Screenshot 2023-05-04 014336](https://user-images.githubusercontent.com/110028481/236076989-25fa5fa1-203a-4d83-802c-e12b7999fcce.png)


### 2. EC2 Instances

Two EC2 instances are created in this project:
- A bastion host with a public IP address and an associated Security Group for SSH access. This instance is placed in the public subnet.
- An application host with a private IP address and an associated Security Group for application access. This instance is placed in the private subnet.
![Screenshot 2023-05-04 014157](https://user-images.githubusercontent.com/110028481/236194929-d90ecc9a-86ee-4d93-963d-a1a3c324766c.png)

### 3. Database and Cache

An RDS instance and Elastic Cache are provisioned using Terraform modules:
- The RDS instance is created using the AWS RDS service and is managed by Terraform.
![Screenshot 2023-05-04 015507](https://user-images.githubusercontent.com/110028481/236077273-8e223d62-73dc-43c4-b1da-ace75c3441ee.png)
- The Elastic Cache instance is created using the AWS RDS service and is managed by Terraform.
![Screenshot 2023-05-04 015541](https://user-images.githubusercontent.com/110028481/236077277-15122bc6-a716-4a4a-ba2c-8e87b582253a.png)

### 4. Workspace and Environment Setup

The project is organized into separate environments (dev and prod) using workspaces:
- Workspaces are created for the `dev` and `prod` environments.
![Screenshot 2023-05-04 031429](https://user-images.githubusercontent.com/110028481/236077442-e581b7dd-5e03-454c-8f1e-b0bb7640253d.png)
- Variable definition files (.tfvars) are used to manage different configurations for each environment.
- A local-exec provisioner is used to print the public IP of the bastion host.
![Screenshot 2023-05-04 014059](https://user-images.githubusercontent.com/110028481/236077160-68e29a47-e499-490c-8bea-78b0c866bade.png)

### 5. Additional Features

- The infrastructure code is uploaded to a Github project.
- A Lambda function is set up to trigger when changes are detected in the Terraform state file. The function sends email notifications for these changes.
![Screenshot 2023-05-04 020415](https://user-images.githubusercontent.com/110028481/236077556-a9009fd4-b009-4f20-a91f-99b36d4c15b1.png)
![Screenshot 2023-05-04 020612](https://user-images.githubusercontent.com/110028481/236077590-ca609062-e401-4049-8a6b-a8d0aba6a7c9.png)
![Screenshot 2023-05-04 031052](https://user-images.githubusercontent.com/110028481/236077604-a64cf777-1de9-4e14-9788-99f16c85492f.png)
![Screenshot 2023-05-04 031651](https://user-images.githubusercontent.com/110028481/236077996-b1637ca0-c5b8-4487-aa04-1cc9383bc126.png)
![Screenshot 2023-05-04 024657](https://user-images.githubusercontent.com/110028481/236077614-8c117f25-7558-41cb-877a-0ef5d2f17620.png)

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
