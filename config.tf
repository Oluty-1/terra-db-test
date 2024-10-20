# main.tf

module "vpc" {
  source               = "./vpc"
  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  enable_nat_gateway   = var.enable_nat_gateway
  ZONE1                = var.ZONE1
  ZONE2                = var.ZONE2
}

module "vpc_secondary" {
  source               = "./vpc"
  project_name         = var.project_name
  environment          = "${var.environment}-dr"
  vpc_cidr             = var.secondary_vpc_cidr
  public_subnet_cidrs  = var.secondary_public_subnet_cidrs
  private_subnet_cidrs = var.secondary_private_subnet_cidrs
  enable_nat_gateway   = var.enable_nat_gateway
  ZONE1                = var.SECONDARY_ZONE1
  ZONE2                = var.SECONDARY_ZONE2

  providers = {
    aws = aws.secondary
  }
}

module "database" {
  source                  = "./database"
  project_name            = var.project_name
  environment             = var.environment
  vpc_id                  = module.vpc.vpc_id
  vpc_cidr                = var.vpc_cidr
  subnet_ids              = module.vpc.private_subnet_ids
  db_name                 = var.db_name
  db_username             = var.db_username
  db_password             = var.db_password
  db_max_capacity         = var.db_max_capacity
  db_min_capacity         = var.db_min_capacity
  db_auto_pause_seconds   = var.db_auto_pause_seconds
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window

  providers = {
    aws           = aws
    aws.secondary = aws.secondary
  }
}


