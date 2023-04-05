################################################################################
# ECS Outputs
################################################################################

output "ecs_cluster_name" {
  description = "The name of the ECS cluster and the name of the core stack"
  value       = module.ecs.cluster_name
}

output "ecs_cluster_id" {
  description = "The ID of the ECS cluster"
  value       = module.ecs.cluster_id
}

output "ecs_task_execution_role_name" {
  description = "The ARN of the task execution role"
  value       = module.ecs.task_exec_iam_role_name
}

output "ecs_task_execution_role_arn" {
  description = "The ARN of the task execution role"
  value       = module.ecs.task_exec_iam_role_arn
}

output "service_discovery_namespaces" {
  description = "Service discovery namespaces already available"
  value       = aws_service_discovery_private_dns_namespace.this
}
