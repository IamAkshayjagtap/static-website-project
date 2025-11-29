variable "region" {
  default = "ap-south-1"
}

variable "ami_id" {
  default = "ami-02b8269d5e85954ef"  # Latest Ubuntu in ap-south-1
}

variable "key_name" {
  default = "static-web-key"
}

variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}
