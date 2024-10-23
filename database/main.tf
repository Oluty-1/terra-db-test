
resource "aws_db_subnet_group" "main" {
  name       = "main-subnet-group"
  subnet_ids = module.vpc.private_subnets

  tags = {
    Environment = var.environment
  }
}

resource "aws_rds_cluster" "main" {
  cluster_identifier     = "${var.environment}-aurora-cluster"
  engine                = "aurora-mysql"
  engine_mode           = "serverless"
  engine_version        = "5.7" 
  database_name         = var.db_name
  master_username       = var.db_username
  master_password       = var.db_password
  
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  
  backup_retention_period = 7
  preferred_backup_window = "03:00-04:00"
  
  enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
  
  scaling_configuration {
    auto_pause               = true
    max_capacity            = 16
    min_capacity            = 1
    seconds_until_auto_pause = 300 
    timeout_action          = "ForceApplyCapacityChange"
  }