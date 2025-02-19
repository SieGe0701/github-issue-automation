locals {
  config_data = yamldecode(file("../specifications/config.yml"))
}


provider "github" {
  token = var.github_token
}

resource "github_issue" "automated_issue" {
  repository = "issue_poc_check"   # Replace with your repository name
  title      = var.title

  body = <<EOT
### Input A
${local.config_data["A"]["input_a"]}

### Input B
${local.config_data["A"]["input_b"]}

### Input C
${local.config_data["A"]["input_c"]}
EOT
}