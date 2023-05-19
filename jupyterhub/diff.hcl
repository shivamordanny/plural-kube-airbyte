metadata {
  path = "jupyterhub"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "jupyterhub/terraform"
  target  = "jupyterhub/terraform"
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
  wkdir   = "jupyterhub/terraform"
  target  = "jupyterhub/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "jupyterhub",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "jupyterhub/helm"
  target  = "jupyterhub/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "jupyterhub",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
