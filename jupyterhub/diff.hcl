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

  sha     = "h1:yfNXhoPK/fQty01LoSECrF4wjzNpeZO4p96WteGv3ws="
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

  sha     = "h1:yfNXhoPK/fQty01LoSECrF4wjzNpeZO4p96WteGv3ws="
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

  sha     = "h1:QSTHr6NctlQ5b8bUj6SKgpKsukYeNU0jfDP54gcRApY="
  retries = 0
  verbose = false
}
