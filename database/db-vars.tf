# database/variables.tf

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "environment" {
  description = "The deployment environment"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the database will be deployed"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block of the VPC where the database will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "The IDs of the subnets where the database will be deployed"
  type        = list(string)
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "db_username" {
  description = "The master username for the database"
  type        = string
}

variable "db_password" {
  description = "The master password for the database"
  type        = string
  sensitive   = true
}

variable "db_max_capacity" {
  description = "The maximum capacity for database autoscaling"
  type        = number
}

variable "db_min_capacity" {
  description = "The minimum capacity for database autoscaling"
  type        = number
}

variable "db_auto_pause_seconds" {
  description = "The number of seconds before the database auto-pauses"
  type        = number
}

variable "backup_retention_period" {
  description = "The number of days to retain backups"
  type        = number
}

variable "preferred_backup_window" {
  description = "The daily time range during which automated backups are created"
  type        = string
}
