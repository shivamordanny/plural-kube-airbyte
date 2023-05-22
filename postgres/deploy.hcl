metadata {
  path = "postgres"
  name = "deploy"
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

step "terraform-apply" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:tee4U3JX5i8fV35qSdCzZmWwkvNwqd7zBgxl+HEnMTg="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "postgres"
  target  = "postgres/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "postgres",
  ]

  sha     = "h1:tee4U3JX5i8fV35qSdCzZmWwkvNwqd7zBgxl+HEnMTg="
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "postgres"
  target  = "postgres/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "postgres",
  ]

  sha     = "h1:copmgn9ngt8ifBRwxGQ+GXUgx7wmLdCA/InC6/5DUkU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "postgres"
  target  = "postgres/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "postgres",
  ]

  sha     = "h1:pMgjhaPJBbo8Nkhq1exVJC7k/OErU2T7OztpUJBEp34="
  retries = 2
  verbose = false
}
