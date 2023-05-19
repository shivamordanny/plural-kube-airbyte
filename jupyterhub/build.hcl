metadata {
  name = "jupyterhub"
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
  path = "helm/jupyterhub"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "c705cd06ecd4d7cb2f8dddd7d642aa245acaa99ecfa1fe71142971467a935bb1"
    retries = 0
    verbose = false
  }
}
