metadata {
  path = "jupyterhub"
  name = "deploy"
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

step "terraform-apply" {
  wkdir   = "jupyterhub/terraform"
  target  = "jupyterhub/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:yfNXhoPK/fQty01LoSECrF4wjzNpeZO4p96WteGv3ws="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "jupyterhub"
  target  = "jupyterhub/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "jupyterhub",
  ]

  sha     = "h1:yfNXhoPK/fQty01LoSECrF4wjzNpeZO4p96WteGv3ws="
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "jupyterhub"
  target  = "jupyterhub/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "jupyterhub",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "jupyterhub"
  target  = "jupyterhub/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "jupyterhub",
  ]

  sha     = "h1:QSTHr6NctlQ5b8bUj6SKgpKsukYeNU0jfDP54gcRApY="
  retries = 2
  verbose = false
}
