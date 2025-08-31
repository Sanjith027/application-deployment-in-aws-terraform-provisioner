output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.server.public_ip
}

output "web_link" {
  description = "URL to access the Flask web app"
  value       = "http://${aws_instance.server.public_ip}"
}
