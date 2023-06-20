variable "web_app_sg_vpc_id" {
  description = "ID of the VPC where the web application security group will be created"
  type        = string
}

variable "public_key" {
  description = "SSH public key"
  type        = string
}
