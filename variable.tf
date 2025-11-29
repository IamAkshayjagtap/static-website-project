variable "region" {
  default = "ap-south-1"
}

variable "ami_id" {
  default = "ami-0e5b6b6a9f3c52f4d"  # Latest Ubuntu in ap-south-1
}

variable "key_name" {
  default = "static-web-key"
}

variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}
