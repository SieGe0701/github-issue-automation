variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

variable "title" {
  description = "title for the issue"
  type = string
}