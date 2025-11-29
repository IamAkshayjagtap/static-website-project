variable "region" {
  default = "ap-south-1"
}

variable "ami_id" {
  default = "ami-0f5ae0fd89ce5cc6f"  # Latest Ubuntu in ap-south-1
}

variable "key_name" {
  default = "static-web-key"
}

variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}
