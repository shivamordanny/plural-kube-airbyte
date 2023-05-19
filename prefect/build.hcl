metadata {
  name = "prefect"
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
  path = "helm/prefect"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "d97f85dba0cd00847ecfb145cc8e539e5a1e086e1ea0014450990b5e2c139835"
    retries = 0
    verbose = false
  }
}
