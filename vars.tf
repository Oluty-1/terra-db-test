# vars.tf

variable "project_name" {
  description = "The name of the project"
  default     = "terra"
}

variable "environment" {
  description = "The deployment environment"
  default     = "dev"
}

variable "primary_region" {
  description = "The primary AWS region for deployment"
  default     = "us-west-1"
}

variable "ZONE1" {
  default = "us-west-1a"
}

variable "ZONE2" {
  default = "us-west-1b"
}

variable "secondary_region" {
  description = "The secondary AWS region for disaster recovery"
  default     = "us-west-2"
}

# VPC variables
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "allocated_storage" {
  description = "The allocated storage in gibibytes"
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "The type of storage to use"
  type        = string
  default     = "gp2"
}

# Database variables
variable "db_name" {
  description = "The name of the database"
  default     = "terradb"
}

variable "db_username" {
  description = "The master username for the database"
  default     = "admin"
}

variable "db_password" {
  description = "The master password for the database"
  sensitive   = true
  default     = "admin123"
}

variable "db_instance_class" {
  description = "The instance class for the database"
  default     = "db.t3.micro"
}

# Autoscaling variables
variable "db_min_capacity" {
  description = "The minimum capacity for database autoscaling"
  type        = number
  default     = 1
}

variable "db_max_capacity" {
  description = "The maximum capacity for database autoscaling"
  type        = number
  default     = 2
}

variable "db_auto_pause_seconds" {
  description = "The number of seconds before the database auto-pauses"
  type        = number
  default     = 300
}

# Backup variables
variable "backup_retention_period" {
  description = "The number of days to retain backups"
  type        = number
  default     = 7
}

variable "preferred_backup_window" {
  description = "The daily time range during which automated backups are created"
  type        = string
  default     = "07:00-09:00"
}

# Secondary VPC variables
variable "secondary_vpc_cidr" {
  description = "The CIDR block for the secondary VPC"
  default     = "10.1.0.0/16"
}

variable "secondary_public_subnet_cidrs" {
  description = "List of CIDR blocks for secondary public subnets"
  type        = list(string)
  default     = ["10.1.1.0/24", "10.1.2.0/24"]
}

variable "secondary_private_subnet_cidrs" {
  description = "List of CIDR blocks for secondary private subnets"
  type        = list(string)
  default     = ["10.1.3.0/24", "10.1.4.0/24"]
}

variable "SECONDARY_ZONE1" {
  default = "us-west-2a"
}

variable "SECONDARY_ZONE2" {
  default = "us-west-2b"
}

variable "enable_nat_gateway" {
  type    = bool
  default = true
}
