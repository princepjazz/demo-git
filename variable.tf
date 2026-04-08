
variable "region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "us-east-1"
}

variable "bastion_instance_type" {
  description = "Instance type for bastion host"
  type        = string
  default     = "t3.micro"
}

variable "web_instance_type" {
  description = "Instance type for web servers"
  type        = string
  default     = "t3.micro"
}

variable "db_instance_type" {
  description = "Instance type for database server"
  type        = string
  default     = "t3.small"
}

variable "key_pair_name" {
  description = "Optional AWS key pair name for EC2 access"
  type        = string
  default     = ""
}

variable "admin_ip" {
  description = "Your current public IP in CIDR format for bastion SSH access, e.g. 41.190.2.10/32"
  type        = string
