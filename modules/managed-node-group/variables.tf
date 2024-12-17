variable "node_group_name" {
  type        = string
  description = "Project name"
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet to create EKS cluster"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
  default     = null
}