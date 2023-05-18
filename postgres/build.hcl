metadata {
  name = "postgres"
}

scaffold "terraform" {
  path = "terraform"
  type = "terraform"
}

scaffold "crds" {
  path = "crds"
  type = "crd"
}

scaffold "helm" {
  path = "helm/postgres"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "189d6597c4c0a8a515302f49562e7dcab18f3624cf2bf1da64260407b23c05e9"
    retries = 0
    verbose = false
  }
}
