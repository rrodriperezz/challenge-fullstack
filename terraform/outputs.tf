output "environment" {
  value       = var.environment
  description = "Environment this state belongs to"
}

output "alb_dns_name" {
  value       = aws_lb.app.dns_name
  description = "DNS name of the load balancer"
}

output "app_url" {
  value       = "http://${aws_lb.app.dns_name}"
  description = "Public URL of the application"
}

output "cluster_name" {
  value       = aws_ecs_cluster.main.name
  description = "ECS cluster name"
}

output "ecr_repository_url" {
  value       = aws_ecr_repository.app.repository_url
  description = "Push images here, then apply with -var image_tag=<tag>"
}
