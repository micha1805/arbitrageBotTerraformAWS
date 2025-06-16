output "alb_dns_name" {
  description = "DNS name of the load balancer"
  value       = aws_lb.main.dns_name
}

output "jenkins_url" {
  description = "URL for Jenkins"
  value       = "http://jenkins.${var.domain_name}"
}

output "jenkins_ip" {
  description = "Public IP of the Jenkins instance"
  value       = aws_instance.jenkins.public_ip
}

output "staging_url" {
  description = "URL for staging environment"
  value       = "http://staging.${var.domain_name}"
}

output "prod_url" {
  description = "URL for production environment"
  value       = "http://${var.domain_name}"
}

output "ecr_repo_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.trading_bot.repository_url
}