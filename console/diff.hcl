metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:gioUF2XBoK8wsWaDOiA1aUNOyMfDn3sLaUGTi2fd7VI="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:gioUF2XBoK8wsWaDOiA1aUNOyMfDn3sLaUGTi2fd7VI="
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:U5m0stHr1Pt/LeZ2ZwWlI3PQR9d8MkxvkeqQjDiV2zk="
  retries = 0
  verbose = false
}
