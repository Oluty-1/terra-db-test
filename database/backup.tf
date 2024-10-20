resource "aws_backup_plan" "aurora_backup" {
  name = "aurora-cross-region-backup"

  rule {
    rule_name         = "daily-backup"
    target_vault_name = aws_backup_vault.aurora_vault.name
    schedule          = "cron(0 5 * * ? *)"
    
    lifecycle {
      delete_after = 14
    }

    copy_action {
      destination_vault_arn = aws_backup_vault.aurora_vault_dr.arn
    }
  }
}

resource "aws_backup_vault" "aurora_vault" {
  name     = "aurora-backup-vault"
}

resource "aws_backup_vault" "aurora_vault_dr" {
  provider = aws.secondary
  name     = "aurora-backup-vault-dr"
}

resource "aws_backup_selection" "aurora_backup" {
  iam_role_arn = aws_iam_role.backup_role.arn
  name         = "aurora-backup-selection"
  plan_id      = aws_backup_plan.aurora_backup.id

  resources = [
    aws_rds_cluster.aurora.arn
  ]
}
