variable "location" {
  description = "Região onde o recurso é criado"
  type        = string
  default     = "Brazil South"
}

variable "aws_pub_key" {
  description = "Public Key for aws"
  type        = string
}

variable "azure_pub_key" {
  description = "Public Key for azure"
  type        = string
}
