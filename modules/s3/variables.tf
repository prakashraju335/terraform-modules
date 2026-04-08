variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "versioning_enabled" {
  description = "Enable versioning on the bucket"
  type        = bool
  default     = false
}

variable "acl" {
  description = "Access control list for the bucket"
  type        = string
  default     = "private"
}

variable "tags" {
  description = "Tags to apply to the bucket"
  type        = map(string)
  default     = {}
}
