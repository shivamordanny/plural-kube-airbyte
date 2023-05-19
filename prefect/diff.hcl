metadata {
  path = "prefect"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "prefect/terraform"
  target  = "prefect/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "prefect/terraform"
  target  = "prefect/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "prefect",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "prefect/helm"
  target  = "prefect/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "prefect",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
