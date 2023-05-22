metadata {
  path = "postgres"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:tee4U3JX5i8fV35qSdCzZmWwkvNwqd7zBgxl+HEnMTg="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "postgres",
  ]

  sha     = "h1:tee4U3JX5i8fV35qSdCzZmWwkvNwqd7zBgxl+HEnMTg="
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "postgres/helm"
  target  = "postgres/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "postgres",
  ]

  sha     = "h1:pMgjhaPJBbo8Nkhq1exVJC7k/OErU2T7OztpUJBEp34="
  retries = 0
  verbose = false
}
