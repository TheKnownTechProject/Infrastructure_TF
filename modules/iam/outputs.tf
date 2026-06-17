output "service_role_name" {
  description = "Elastic Beanstalk service role name."
  value       = aws_iam_role.service.name
}

output "frontend_instance_profile_name" {
  description = "Frontend EC2 instance profile name."
  value       = aws_iam_instance_profile.frontend.name
}

output "backend_instance_profile_name" {
  description = "Backend EC2 instance profile name."
  value       = aws_iam_instance_profile.backend.name
}
