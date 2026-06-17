output "application_name" {
  description = "Elastic Beanstalk application name."
  value       = aws_elastic_beanstalk_application.this.name
}

output "environment_name" {
  description = "Elastic Beanstalk environment name."
  value       = aws_elastic_beanstalk_environment.this.name
}
