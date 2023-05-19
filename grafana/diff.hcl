metadata {
  path = "grafana"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:F4YP/cFbvbRJmtXELuXIdAf8Hirx+gYX3n6zMheIKR0="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "grafana",
  ]

  sha     = "h1:F4YP/cFbvbRJmtXELuXIdAf8Hirx+gYX3n6zMheIKR0="
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "grafana/helm"
  target  = "grafana/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "grafana",
  ]

  sha     = "h1:J+MA/C4082X4sU9MY1ym7ose4Rkc8EO9Dyp+GIkz0cw="
  retries = 0
  verbose = false
}
