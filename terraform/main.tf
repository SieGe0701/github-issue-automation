locals {
  config_data = yamldecode(file("../specifications/specification-main.yml"))
}


provider "github" {
  token = var.github_token
}

resource "github_issue" "automated_issue" {
  repository = "issue_poc_check"   # Replace with your repository name
  title      = var.title

  body = <<EOT
### repo_name
${local.config_data["github"]["repo_name"]}

### description
${local.config_data["github"]["description"]}

### visibility
${local.config_data["github"]["visibility"]}

### product
${local.config_data["github"]["product"]}

### repo_template
${local.config_data["github"]["repo_template"]}

### pci_dss
${local.config_data["github"]["pci_dss"]}

### github_group
${local.config_data["github"]["github_group"]}

### permission
${local.config_data["github"]["permission"]}

EOT
}