variable "environment" {
  type        = string
  description = "Deployment environment; must match the Terraform workspace"

  validation {
    condition     = contains(["devel", "stage"], var.environment)
    error_message = "environment must be \"devel\" or \"stage\"."
  }
}

variable "aws_region" {
  type        = string
  description = "AWS region for deployment"
  default     = "us-east-2"
}

variable "app_name" {
  type        = string
  description = "Application name"
  default     = "rdicidr"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the environment VPC"
}

variable "image_tag" {
  type        = string
  description = "Tag of the image in this environment's ECR repository (e.g. the git commit SHA)"
}

variable "container_port" {
  type        = number
  description = "Port the container listens on"
  default     = 80
}

variable "health_check_path" {
  type        = string
  description = "Health check endpoint path"
  default     = "/health"
}

variable "desired_count" {
  type        = number
  description = "Number of ECS tasks to run"
  default     = 1
}
