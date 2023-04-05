################################################################################
# Providers
################################################################################

provider "aws" {
  region = var.region
}

################################################################################
# ECS Blueprint
################################################################################

module "ecs" {
  source = "github.com/terraform-aws-modules/terraform-aws-ecs?ref=v4.1.3"

  cluster_name = var.cluster_name

  cluster_service_connect_defaults = {
    namespace = aws_service_discovery_private_dns_namespace.this.arn
  }

  fargate_capacity_providers = {
    FARGATE      = {}
    FARGATE_SPOT = {}
  }

  # Shared task execution role
  create_task_exec_iam_role = true
  # Allow read access to all SSM params in current account for demo
  task_exec_ssm_param_arns = ["arn:aws:ssm:${var.region}:${data.aws_caller_identity.current.account_id}:parameter/*"]
  # Allow read access to all secrets in current account for demo
  task_exec_secret_arns = ["arn:aws:secretsmanager:${var.region}:${data.aws_caller_identity.current.account_id}:secret:*"]

  tags = local.tags
}

################################################################################
# Service discovery namespaces
################################################################################

resource "aws_service_discovery_private_dns_namespace" "this" {
  name        = "default.${var.cluster_name}.local"
  description = "Service discovery namespace.clustername.local"
  vpc         = var.vpc_id

  tags = local.tags
}
