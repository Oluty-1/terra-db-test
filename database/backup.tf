resource "aws_backup_vault" "aurora_vault" {
  provider = aws.primary
  name     = "aurora-backup-vault"
}

resource "aws_backup_vault" "aurora_vault_dr" {
  provider = aws.backup
  name     = "aurora-backup-vault-dr"
}

resource "aws_backup_plan" "aurora_backup" {
  provider = aws.primary
  name     = "aurora-cross-region-backup"

  rule {
    rule_name         = "daily-backup"
    target_vault_name = aws_backup_vault.aurora_vault.name
    schedule          = "cron(0 5 * * ? *)"  # Daily at 5 AM UTC
    
    lifecycle {
      delete_after = 14 
    }

    copy_action {
      destination_vault_arn = aws_backup_vault.aurora_vault_dr.arn
      lifecycle {
        delete_after = 14
      }
    }
  }
}

resource "aws_backup_selection" "aurora_backup" {
  provider      = aws.primary
  name          = "aurora-backup-selection"
  iam_role_arn  = aws_iam_role.backup_role.arn
  plan_id       = aws_backup_plan.aurora_backup.id

  resources = [
    aws_rds_cluster.main.arn
  ]
}