variable "project_name" {
  type        = string
  description = "Project name"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
  default     = null
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet to create EKS cluster"
}

variable "endpoint_private_access" {
  type        = bool
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled"
  default     = true
}

variable "endpoint_public_access" {
  type        = bool
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled"
  default     = true
}

variable "eks_version" {
  type        = string
  description = "EKS version"
  default     = "1.31"
}