variable "instance_type" {
  description = "Value for Instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "Value for AMI ID"
}

variable "key_name" {
  description = "Value for Key name"
}

variable "sg-name" {
  description = "Name for Security group"
}

variable "vpc-cidr" {
  description = "Value for VPC CIDR"
  default     = "10.0.0.0/16"
}

variable "subnet_az" {
  description = "Availability Zone of subnet"
}

variable "region" {
  description = "AWS region"
}
