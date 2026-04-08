This project provisions a complete AWS infrastructure for TechCorp using Terraform.

## Infrastructure Overview

The deployment includes:

- A VPC with CIDR block `10.0.0.0/16`
- 2 public subnets across 2 availability zones
- 2 private subnets across 2 availability zones
- Internet Gateway
- 2 NAT Gateways, one in each public subnet
- Route tables and subnet associations
- Security groups for bastion, web, and database tiers
- Bastion host in public subnet with Elastic IP
- 2 web servers in private subnets with Apache installed
- 1 database server in private subnet with PostgreSQL installed
- Application Load Balancer in public subnets
- Target group and health checks
- Outputs for VPC ID, ALB DNS name, and Bastion public IP

---

## Project Structure

```bash
terraform-assessment/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
├── user_data/
│   ├── web_server_setup.sh
│   ├── db_server_setup.sh
│   └── bastion_setup.sh
└── README.md
~                                                                                                                                                                                                                                                                              ~                     
