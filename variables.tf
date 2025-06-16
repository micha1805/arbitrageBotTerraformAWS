variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-3"
}

variable "availability_zone" {
  description = "Zone de disponibilité (AZ)"
  type        = string
  default     = "eu-west-3a"
}

variable "availability_zone_2" {
  description = "Deuxième zone de disponibilité (AZ)"
  type        = string
  default     = "eu-west-3b"
}

variable "vpc_cidr" {
  description = "CIDR du VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR du subnet public"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr_2" {
  description = "CIDR du deuxième subnet public"
  type        = string
  default     = "10.0.4.0/24"
}

variable "private_staging_subnet_cidr" {
  description = "CIDR du subnet privé pour staging"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_prod_subnet_cidr" {
  description = "CIDR du subnet privé pour prod"
  type        = string
  default     = "10.0.3.0/24"
}

variable "jenkins_ami" {
  description = "AMI Amazon Linux pour Jenkins"
  type        = string
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
  default     = "t3.small"
}

variable "key_name" {
  description = "Nom de la clé SSH pour l'instance Jenkins"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the application"
  type        = string
  default     = "myarbitragebot.click"
}