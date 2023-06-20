variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "web_app_sg_name" {
  description = "Name of the web application security group"
  type        = string
  default     = "web-app-security-group"
}

variable "web_app_sg_description" {
  description = "Description of the web application security group"
  type        = string
  default     = "Security group for the web application"
}

variable "web_app_sg_ingress_ports" {
  description = "List of ingress ports to allow in the web application security group"
  type        = list(number)
  default     = [80, 22]
}

variable "web_app_sg_vpc_id" {
  description = "ID of the VPC where the web application security group will be created"
  type        = string
}

variable "public_key" {
  description = "SSH public key"
  type        = string
}
