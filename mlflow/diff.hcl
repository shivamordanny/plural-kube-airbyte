metadata {
  path = "mlflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "mlflow/terraform"
  target  = "mlflow/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:jqFUwe2FM9d+tRU+j2KlfelEIg3/k0SqSuFEhDDeeJ0="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "mlflow/terraform"
  target  = "mlflow/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "mlflow",
  ]

  sha     = "h1:jqFUwe2FM9d+tRU+j2KlfelEIg3/k0SqSuFEhDDeeJ0="
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "mlflow/helm"
  target  = "mlflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "mlflow",
  ]

  sha     = "h1:W3Jph61jh0xFebAMVGFGnZHraLmSczJziQGGcOZYM48="
  retries = 0
  verbose = false
}
