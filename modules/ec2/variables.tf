variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "my-ec2-instance"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 in us-east-1
}

variable "availability_zone" {
  description = "Availability zone for the instance"
  type        = string
  default     = "us-east-1a"
}

variable "tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
  default     = {}
}
